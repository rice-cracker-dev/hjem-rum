{lib}: let
  inherit (lib.types) oneOf str bool int float attrsOf listOf path;

  kittyValueType = oneOf [str bool int float path];
  kittyType = attrsOf (oneOf [(listOf kittyValueType) kittyValueType]);
in
  kittyType
