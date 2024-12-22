{ ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/christian/git/nix";
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep 9";
    };
  };
}
