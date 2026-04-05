{ config, ... }:
{
  programs.vim.enable = true;
  home.file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.vimrc";
}
