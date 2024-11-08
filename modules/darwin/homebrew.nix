{ lib, config, ... }:
let
  cfg = config.homebrew;
  casks = builtins.filter (key: cfg.apps.${key}) (builtins.attrNames cfg.apps);
  enabled = (builtins.length casks) > 0;
  mkCaskOption = name: enabled:
    lib.mkOption {
      type = lib.types.bool;
      default = enabled;
      description = "Install ${name} cask via Homebrew.";
    };
in {
  options.homebrew = {
    apps = {
      raycast = mkCaskOption "Raycast" true;
      slack = mkCaskOption "Slack" false;
      spotify = mkCaskOption "Spotify" true;
      whatsapp = mkCaskOption "WhatsApp" true;
      protonvpn = mkCaskOption "ProtonVPN" true;
      appcleaner = mkCaskOption "appcleaner" true;
      keybase = mkCaskOption "keybase" true;
      discord = mkCaskOption "Discord" true;
      elgato-control-center = mkCaskOption "Elgato Control Center" true;
      elgato-wave-link = mkCaskOption "Elgato Wave Link" true;
      # "arc"
      # # "wezterm"
      # "setapp"
      # "affinity-designer"
      # "affinity-photo"
      # "affinity-publisher"
      # "betterdisplay"
      # "figma"
      # "obsidian"
      # "muzzle"
      # "karabiner-elements"
      # "notion-calendar"
      # "obsidian"
      # "transmission"
      # "little-snitch"
      # "micro-snitch"
      # "docker"
      # "discord"
    };
  };
  config = {
    homebrew = {
      enable = enabled;
      casks = casks;
      caskArgs.no_quarantine = true;
    };
  };
}