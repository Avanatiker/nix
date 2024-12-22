{ pkgs, ... }:

{
  users.users.christian = {
    isNormalUser = true;
    description = "Christian";
    home = "/home/christian";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
