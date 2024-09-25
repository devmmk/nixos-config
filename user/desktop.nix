{ config, pkgs, ... }:

{
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
}