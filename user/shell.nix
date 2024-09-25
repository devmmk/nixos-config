{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    lsd
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = { ls = "lsd"; };
    oh-my-zsh = {
      enable = true;
      theme = "half-life";
      plugins = [
        "git"
        "pip"
      ];
    };
  };
  
}