# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
    # enable support for broadcom_sta
    allowUnfree = true;

    chromium = {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };
  };

  # Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "fbcon" ];

  boot.initrd.luks.devices = [
    {
      name = "rootfs"; device = "/dev/sda5"; preLVM = true;
    }
  ];

  boot.loader.grub.device = "/dev/sda";

  # networking.hostName = "nixos"; # Define your hostname.
  networking.hostId = "f83ab886";
  networking.wireless.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    acpi
    chromiumDev
    git
    st
    terminator
    tmux
    vim

    (lib.overrideDerivation dwm (attrs: {
      patches = [ ./dwm/dwm-st.patch ];
    }))
  ];

  # Enable acpi
  services.acpid.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    windowManager = {
      default = "none";

      session = [{
        name = "dwm";
        start = "/run/current-system/sw/bin/dwm";
      }];
    };

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

    multitouch = {
      enable = true;
      invertScroll = true;
    };

    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };
  };

  services.xserver.layout = "us";
  services.xserver.xkbOptions = "ctrl:nocaps";

  users.extraUsers.bernerd = {
    name = "bernerd";
    group = "users";
    uid = 1000;
    extraGroups = [ "wheel" ];
    createHome = true;
    home = "/home/bernerd";
    shell = "/run/current-system/sw/bin/bash";
  };
}
