{ ... }:

{
  # Enable OpenSSH daemon
  services.openssh.enable = true;

  # Disable TTY1 login prompt if using only graphical sessions
  services.getty.autologinUser = null;
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  services = {
    xserver = {
      enable = true;
      # Load nvidia driver for Xorg and Wayland
      videoDrivers = [ "nvidia" ];

      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;
    };
    desktopManager.plasma6.enable = true;

    # Login SDDM
    displayManager = {
      sddm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "christian";
    };

    # Configure keymap in X11
    xserver.xkb = {
      layout = "de";
      variant = "";
    };

    # Enable CUPS to print documents.
    printing.enable = true;
  };
}
