{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      yay = "cd ~/git/nix; nix fmt; nix flake update; sudo nixos-rebuild switch --flake ~/git/nix";
    };
    ohMyZsh = {
      enable = true;
    };
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    interactiveShellInit = "fastfetch";
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
}
