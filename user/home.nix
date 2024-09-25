{ config, pkgs, lib, ... }:

{
  imports = [
    ./shell.nix
    ./nvim.nix
    ./desktop.nix
  ];
  home.username = "penguin";
  home.homeDirectory = "/home/penguin";

  # the rest of your home-manager configuration
  
  # virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
    };
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
