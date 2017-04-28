# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.checkJournalingFS = false;
  networking.hostName = "arch-desk"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "de";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
      wget
      git
      tmux
      stow
      emacs
      cmake
      rofi
      chromium
      dmenu
      neovim
      rxvt_unicode
      gnumake
      rustStable.rustc
      rustStable.cargo
      pavucontrol
      minizip
      vulkan-loader
      unzip
      teamspeak_client
      nitrogen
      compton
      google-chrome
      steam
      gparted
      gcc
  ];
  services.xserver.videoDrivers = [ "amdgpu-pro" "modsettings"];
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
  #environment.variables = [
  #
  #];


  security.sudo.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "de";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.windowManager.default = "bspwm";
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;
  services.xserver.displayManager.sessionCommands =
  ''
  xset -dpms &
  xset s 0 0 &
  xrandr -r 120 &
  xinput --set-prop 10 'Device Accel Profile' -1
  '';

  services.xserver.config =
  ''
  Section "Device"
  Identifier  "Card0"
  Driver      "amdgpu"
  BusID       "PCI:1:0:0"
  Option      "DRI3" "1"
  Option "TearFree" "on"
  EndSection
  '';
  #services.compton.enable = true;
  #services.compton.refreshRate = 120;
  #services.compton.vSync = "opengl-swc";
  #services.compton.extraOptions =
  #''
  #glx-copy-from-front = true;
  #glx-swap-method = 2;
  #vsync-aggressive = true;
  #'';


  hardware.pulseaudio.enable = true;

  nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs" "nixos-config=/etc/nixos/configuration.nix" "/nix/var/nix/profiles/per-user/root/channels" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.maik = {
    isNormalUser = true;
    home = "/home/maik";
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = "/run/current-system/sw/bin/zsh";
  };

  services.xserver.libinput.enable = true;
  #services.xserver.libinput.accelProfile = "flat";
  services.xserver.libinput.additionalOptions =
  ''
	    Option "AccelerationProfile" "-1"
	    Option "AccelerationScheme" "none"
	    Option "AccelSpeed" "-1"
  '';

  #services.xserver.inputClassSections
  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
