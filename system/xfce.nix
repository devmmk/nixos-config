{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      blueman
      evince
      firefox
      foliate
      font-manager
      gimp-with-plugins
      gnome.file-roller
      gnome.gnome-disk-utility
      inkscape-with-extensions
      libqalculate
      libreoffice
      orca
      pavucontrol
      qalculate-gtk
      thunderbird
      wmctrl
      xclip
      xcolor
      xcolor
      xdo
      xdotool
      xfce.catfish
      xfce.gigolo
      xfce.orage
      xfce.xfburn
      xfce.xfce4-appfinder
      xfce.xfce4-clipman-plugin
      xfce.xfce4-cpugraph-plugin
      xfce.xfce4-dict
      xfce.xfce4-fsguard-plugin
      xfce.xfce4-genmon-plugin
      xfce.xfce4-netload-plugin
      xfce.xfce4-panel
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-systemload-plugin
      xfce.xfce4-weather-plugin
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-xkb-plugin
      xfce.xfdashboard
      xorg.xev
      xsel
      xtitle
      xwinmosaic
      webcamoid
      dracula-theme
      zuki-themes
      tokyonight-gtk-theme
      tela-circle-icon-theme
      whitesur-cursors
      themechanger
      libsForQt5.qtstyleplugins
      qt5ct
      qt6ct
      plank
    ];
  };

  hardware = {
    bluetooth.enable = true;
  };

  programs = {
    dconf.enable = true;
    firefox.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick = {
            enable = true;
            theme.name = "Zukitre-dark";
          };
        };
      };
      desktopManager.xfce.enable = true;
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    cantarell-fonts
    roboto
    vazir-fonts
    vazir-code-font

    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })

  ];

  sound.enable = true;
}
