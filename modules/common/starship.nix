{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      scan_timeout = 50;
      aws.disabled = true;
      c.format = "via [$symbol]($style)";
      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
      directory = {
        truncation_length = 100;
        truncate_to_repo = false;
        truncation_symbol = "…/";
      };
      docker_context.disabled = true;
      gcloud.disabled = true;
      git_branch.symbol = "";
      golang.disabled = true;
      haskell.disabled = true;
      hostname.disabled = true;
      nodejs.disabled = true;
      package.disabled = true;
      ruby.disabled = true;
    };
  };
}
