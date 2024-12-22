{ ... }:

{
  imports = [
    ./nixos
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Ensure the state version matches your NixOS version
  system.stateVersion = "24.05";
}
