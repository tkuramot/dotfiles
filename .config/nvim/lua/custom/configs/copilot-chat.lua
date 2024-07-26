local copilot_chat = require "CopilotChat"
local select = require "CopilotChat.select"

copilot_chat.setup {
  context = "buffers",
  prompts = {
    Explain = {
      prompt = "/COPILOT_EXPLAIN 選択したコードの説明を段落で書いてください。",
    },
    Review = {
      prompt = "/COPILOT_REVIEW 選択したコードをレビューしてください。",
    },
    Fix = {
      prompt = "/COPILOT_GENERATE このコードに問題があります。バグが修正されたコードを書き直してください。",
    },
    Optimize = {
      prompt = "/COPILOT_GENERATE 選択したコードを最適化してパフォーマンスと可読性を改善してください。",
    },
    Docs = {
      prompt = "/COPILOT_GENERATE 選択したコードにドキュメントコメントを追加してください。",
    },
    Tests = {
      prompt = "/COPILOT_GENERATE コードのテストを生成してください。",
    },
    FixDiagnostic = {
      prompt = "次の診断問題をサポートしてください。",
      selection = select.diagnostics,
    },
    Commit = {
      prompt = "変更に対して commitizen 規約に従ってコミットメッセージを書いてください。タイトルは最大 50 文字で、メッセージは 72 文字で折り返してください。全メッセージを `gitcommit` 言語でコードブロックで囲んでください。",
      selection = select.gitdiff,
    },
    CommitStaged = {
      prompt = "変更に対して commitizen 規約に従ってコミットメッセージを書いてください。タイトルは最大 50 文字で、メッセージは 72 文字で折り返してください。全メッセージを `gitcommit` 言語でコードブロックで囲んでください。",
    },
  },
}
