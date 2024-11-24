{
    config,
    lib,
    pkgs,
    inputs,
    user,
    ...
}:

{
    imports = [ ./home ];

    home = {
        username = "${user.name}";
        homeDirectory = "/home/${user.name}";
        stateVersion = "24.05";
    };

#   cli.enable = true;

    programs = {
        fastfetch.enable = true;
        zsh = {
            enable = true;
#           interactiveShellInit = "fastfetch";
#           shellInit = "set -g fish_greeting";
        };
        firefox.enable = true;
        kitty.enable = true;
    };

    home.packages = with pkgs; [
        # Communication
        telegram-desktop
        discord

        # Development
        jetbrains.idea-ultimate
        gitkraken
        kdePackages.kate
        git
        jdk

        # Entertainment
        steam
        spotify
        vlc

        # Networking
        kdePackages.ktorrent

        # Misc
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    programs.home-manager.enable = true;
}