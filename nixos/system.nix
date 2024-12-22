{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  security.rtkit.enable = true;

  # Configure console keymap
  console.keyMap = "de";

  environment.sessionVariables = {
    # HDR Patch: https://discuss.kde.org/t/hdr-toggle-vanished-from-system-settings/23735/5
    KWIN_DRM_ALLOW_NVIDIA_COLORSPACE = 1;

    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.libGL
      pkgs.xorg.libX11
    ];
  };
}
