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

    programs = {
        fastfetch.enable = true;
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
        zsh-powerlevel10k

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