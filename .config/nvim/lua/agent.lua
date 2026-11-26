-- Send a file location (path:line or path:start-end) to a coding agent running
-- in another pane of the current tmux window.
--
--   vim.g.agent             agent name, also the command that starts it (default "claude")
--   vim.g.agent_startup_ms  wait before typing into a freshly started agent (default 3000)
local M = {}

local OPTION = "@agent_pane" -- tmux window option remembering the target pane

local function agent_name() return vim.g.agent or "claude" end

local function notify(msg, level) vim.notify("agent: " .. msg, level or vim.log.levels.INFO) end

---@param args string[]
---@return string? stdout
---@return string? err
local function tmux(args)
  local r = vim.system({ "tmux", unpack(args) }, { text = true }):wait()
  if r.code ~= 0 then return nil, vim.trim(r.stderr or "") end
  return vim.trim(r.stdout)
end

-- Agent detection -------------------------------------------------------------

---@return table<string, string[]> argv by pid
---@return table<string, string[]> child pids by pid
local function process_tree()
  local argv, children = {}, {}
  local out = vim.system({ "ps", "-A", "-o", "pid=,ppid=,args=" }, { text = true }):wait().stdout or ""
  for line in vim.gsplit(out, "\n", { trimempty = true }) do
    local pid, ppid, args = line:match("^%s*(%d+)%s+(%d+)%s+(.*)$")
    if pid then
      argv[pid] = vim.split(args, "%s+", { trimempty = true })
      children[ppid] = children[ppid] or {}
      table.insert(children[ppid], pid)
    end
  end
  return argv, children
end

-- The agent's executable, or a script in its npm package
-- (`node .../node_modules/@anthropic-ai/claude-code/cli.js`).
local function is_agent_arg(arg, name)
  if vim.fs.basename(arg) == name then return true end
  for seg in vim.gsplit(arg:match("node_modules/(.+)") or "", "/", { plain = true }) do
    if seg == name or vim.startswith(seg, name .. "-") then return true end
  end
  return false
end

-- Whether the agent runs anywhere under pid (a pane's shell).
local function runs_agent(pid, argv, children)
  local name, stack = agent_name(), { pid }
  while #stack > 0 do
    local p = table.remove(stack)
    local args = argv[p] or {}
    -- args[2] covers interpreters such as `node cli.js`
    for i = 1, 2 do
      if args[i] and is_agent_arg(args[i], name) then return true end
    end
    vim.list_extend(stack, children[p] or {})
  end
  return false
end

-- Target pane -----------------------------------------------------------------

---@class agent.Pane
---@field id string
---@field index string
---@field path string

---@return agent.Pane[] other panes in this window running the agent
local function agent_panes()
  local format = "#{pane_id}\t#{pane_index}\t#{pane_pid}\t#{pane_current_path}"
  local out = tmux({ "list-panes", "-t", vim.env.TMUX_PANE, "-F", format }) or ""
  local argv, children = process_tree()
  local panes = {}
  for line in vim.gsplit(out, "\n", { trimempty = true }) do
    local id, index, pid, path = unpack(vim.split(line, "\t"))
    if id ~= vim.env.TMUX_PANE and runs_agent(pid, argv, children) then
      table.insert(panes, { id = id, index = index, path = path })
    end
  end
  return panes
end

local function saved_pane() return tmux({ "show-options", "-wqv", "-t", vim.env.TMUX_PANE, OPTION }) end
local function save_pane(id) tmux({ "set-option", "-w", "-t", vim.env.TMUX_PANE, OPTION, id }) end

local function pick_pane(panes, on_choice)
  vim.ui.select(panes, {
    prompt = "Send to " .. agent_name(),
    format_item = function(p) return ("pane %s  %s"):format(p.index, vim.fn.fnamemodify(p.path, ":~")) end,
  }, function(p)
    if p then on_choice(p.id) end
  end)
end

local function start_agent(on_started)
  local prompt = ("No %s pane in this window. Start one?"):format(agent_name())
  vim.ui.select({ "Yes", "No" }, { prompt = prompt }, function(choice)
    if choice ~= "Yes" then return end
    local split = { "split-window", "-h", "-P", "-F", "#{pane_id}", "-t", vim.env.TMUX_PANE, "-c", vim.fn.getcwd() }
    local id, err = tmux(vim.list_extend(split, { agent_name() }))
    if not id then return notify(err, vim.log.levels.ERROR) end
    on_started(id)
  end)
end

-- Calls on_target(id, started) with the saved pane if it still runs the agent,
-- else the only agent pane, else one picked from a list; with no agent pane,
-- offers to start one.
local function with_target(on_target)
  local panes, saved = agent_panes(), saved_pane()
  local function use(id, started)
    save_pane(id)
    on_target(id, started)
  end

  if vim.iter(panes):any(function(p) return p.id == saved end) then
    on_target(saved, false)
  elseif #panes == 1 then
    use(panes[1].id, false)
  elseif #panes > 1 then
    pick_pane(panes, function(id) use(id, false) end)
  else
    start_agent(function(id) use(id, true) end)
  end
end

-- API -------------------------------------------------------------------------

--- Type `path:range ` into the agent pane and focus it, without pressing Enter,
--- so the instruction is written there.
function M.send(line1, line2)
  if not vim.env.TMUX then return notify("not inside tmux", vim.log.levels.ERROR) end
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then return notify("buffer has no file", vim.log.levels.ERROR) end
  local range = line1 == line2 and tostring(line1) or ("%d-%d"):format(line1, line2)
  local text = ("%s:%s "):format(vim.fn.fnamemodify(file, ":."), range)

  with_target(function(id, started)
    -- a freshly started agent drops input until it is ready
    vim.defer_fn(function()
      local _, err = tmux({ "send-keys", "-t", id, "-l", text })
      if err then return notify(err, vim.log.levels.ERROR) end
      tmux({ "select-pane", "-t", id })
    end, started and (vim.g.agent_startup_ms or 3000) or 0)
  end)
end

return M
