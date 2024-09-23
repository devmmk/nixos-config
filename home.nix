{ config, pkgs, lib, ... }:

{
  home.username = "penguin";
  home.homeDirectory = "/home/penguin";

  home.packages = with pkgs; [
    oh-my-zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "cypher";
      plugins = [
        "git"
        "pip"
      ];
    };
  };
  
  # the rest of your home-manager configuration
  
  gtk = {
    enable = true;
      iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
    theme = {
      name = "Tokyonight-Dark-BL";
      package = pkgs.tokyonight-gtk-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  
  qt = {
    enable = true;
    platformTheme.name = "gtk2";
  };

  programs.gpg.enable = true;
  services.gpg-agent.enable = true;
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
