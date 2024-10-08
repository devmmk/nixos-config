# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./xfce.nix
      ./applications.nix
    ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    copyKernels = true;
    efiInstallAsRemovable = true;
    efiSupport = true;
    devices = [ "nodev" ];
    dedsec-theme = {
      enable = true;
      style = "stalker";
      icon = "color";
      resolution = "1080p";
    };
  };

   # Define your hostname.
  networking.hostName = "nixos";
  networking.nameservers = [ "8.8.8.8" "8.4.4.8" ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tehran";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver = {
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    videoDrivers = [ "nvidia" "intel" ];
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.penguin = {
    isNormalUser = true;
    description = "penguin";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  # List services that you want to enable:
  services = {
    bamf.enable = true;
    openssh.enable = true;
  };

  # Qt theming
  qt = {
    enable = true;
    platformTheme = "gtk2";
  };

  # Virtualisation
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };
  environment.systemPackages = [ pkgs.virt-manager ];
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
  };

  system.stateVersion = "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
