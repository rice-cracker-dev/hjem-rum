{
  config,
  lib,
  rumLib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkOption mkEnableOption mkPackageOption;
  inherit (rumLib.types) kittyType;
  inherit (rumLib.generators.kitty) toKittyConf;

  cfg = config.rum.programs.kitty;
in {
  options.rum.programs.kitty = {
    enable = mkEnableOption "kitty";

    package = mkPackageOption pkgs "kitty" {};

    settings = mkOption {
      type = kittyType;
      default = {};
      example = {
        includes = [
          "./catppuccin-macchiato.conf"
        ];

        background = "#000000";
        background_opacity = 0.75;
      };
      description = ''
        Settings are written as a kitty configuration file to ${config.directory}/.config/kitty/kitty.conf.

        Refer to https://sw.kovidgoyal.net/kitty/conf for
        all available options.
      '';
    };
  };

  config = mkIf cfg.enable {
    packages = [cfg.package];
    files.".config/kitty/kitty.conf".text = mkIf (cfg.settings != {}) (
      toKittyConf cfg.settings
    );
  };
}
