{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    zsh
    git
    gh
    neofetch
    htop
    btop
    vscode
    chromium
    telegram-desktop
    nekoray
    spotify
    cinnamon.warpinator
    vlc
    kdeconnect
    android-tools
    heimdall
    scrcpy
  ];
}
