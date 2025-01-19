{
  pkgs,
  user,
  ...
}:

{
  imports = [ ./fastfetch.nix ];

  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";
    stateVersion = "24.05";
  };

  programs = {
    fastfetch.enable = true;
    firefox.enable = true;
    kitty.enable = true;
    java.enable = true;
  };

  home.packages = with pkgs; [
    # Communication
    telegram-desktop
    discord

    # Development
    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [ "github-copilot" ])
    gitkraken
    kdePackages.kate
    git
    zsh-powerlevel10k
    zsh

    # Entertainment
    prismlauncher
    steam
    spotify
    vlc

    # Networking
    kdePackages.ktorrent
    chromium

    # Misc
    nerd-fonts.fira-code

    # Libraries
    libGL
    nodejs
  ];

  programs.home-manager.enable = true;
}
