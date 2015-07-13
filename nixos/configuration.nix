# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./openvpn-config/default.nix
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

  # In stage-1-init, the resume device seems to
  # not have appeared when it's checked.
  # Adding some wait time allows hibernate / resume
  # to work.
  boot.initrd.postDeviceCommands = "sleep 5";

  boot.loader.grub.device = "/dev/sda";

  # networking.hostName = "nixos"; # Define your hostname.
  networking.hostId = "f83ab886";
  networking.wireless.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  i18n = {
    # consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    dwm = pkgs.dwm.override {
      patches =
        [ ./dwm/dwm-st.patch
          ./dwm/dwm-6.0-font-size.diff
          ./dwm/dwm-6.0-cmd-for-modifier.diff ];
    };

    st = pkgs.callPackage ./st {
      patches =
        [ ./st/st-solarized-light.diff
          ./st/st-0.5-no-bold-colors.diff ];
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    acpi
    acpid
    man_db
    which

    chromiumDev
    dmenu
    dwm
    fish
    git
    slock
    st
    terminator
    tmux
    vim
  ];

  fonts.fonts = [ pkgs.terminus_font ];

  security.setuidPrograms = [ "slock" ];

  sound = {
    enable = true;
    # card 0 is HDMI, card one is PCH (i.e., the actual sound card)
    extraConfig = ''
      defaults.pcm.card 1
      defaults.ctl.card 1
    '';
  };

  # Enable acpi
  services.acpid.enable = true;

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql94;
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    autorun = true;

    displayManager = {
      desktopManagerHandlesLidAndPower = false;

      slim = {
        defaultUser = "bernerd";
        enable = true;
      };
    };

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

    modules = [ pkgs.xf86_input_mtrack ];

    config =
      ''
        Section "InputClass"
          MatchIsTouchpad "on"
          Identifier      "Touchpads"
          Driver "mtrack"
          Option "Sensitivity" "0.55"
          Option "FingerHigh" "12"
          Option "FingerLow" "1"
          Option "IgnoreThumb" "true"
          Option "IgnorePalm" "true"
          Option "TapButton1" "1"
          Option "TapButton2" "3"
          Option "TapButton3" "2"
          Option "TapButton4" "0"
          Option "ClickFinger1" "1"
          Option "ClickFinger2" "3"
          Option "ClickFinger3" "0"
          Option "ButtonMoveEmulate" "false"
          Option "ButtonIntegrated" "true"
          Option "ClickTime" "25"
          Option "BottomEdge" "25"
          Option "ScrollUpButton" "5"
          Option "ScrollDownButton" "4"
          Option "ScrollLeftButton" "7"
          Option "ScrollRightButton" "6"
          Option "SwipeLeftButton" "8"
          Option "SwipeRightButton" "9"
          Option "SwipeUpButton" "0"
          Option "SwipeDownButton" "0"
          Option "ScrollDistance" "75"
        EndSection
      '';

    multitouch = {
      enable = false;
      invertScroll = true;
    };

    synaptics = {
      enable = false;
      horizontalScroll = true;
      minSpeed = "0.7";
      palmDetect = true;
      twoFingerScroll = true;
      additionalOptions = ''
        Option "VertScrollDelta"     "-111"
        Option "HorizScrollDelta"    "-111"
        Option "AreaBottomEdge"      "4000"
      '';
    };
  };

  services.xserver.layout = "us";
  services.xserver.xkbOptions = "ctrl:nocaps";

  time.timeZone = "America/Los_Angeles";

  users.extraUsers.bernerd = {
    name = "bernerd";
    group = "users";
    uid = 1000;
    extraGroups = [ "wheel" ];
    createHome = true;
    home = "/home/bernerd";
    shell = "/run/current-system/sw/bin/fish";
  };
}
