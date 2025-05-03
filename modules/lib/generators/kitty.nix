{lib}: let
  inherit (lib.attrsets) mapAttrsToList;
  inherit (lib.lists) flatten isList;
  inherit (lib.strings) concatStringsSep;

  toKittyProperty = name: value: "${name} ${toString value}";

  toKittyConf = attrs:
    concatStringsSep "\n" (
      flatten (
        mapAttrsToList (
          name: value:
            if (isList value)
            then map (v: (toKittyProperty name v)) value
            else [(toKittyProperty name value)]
        )
        attrs
      )
    );
in {
  inherit toKittyConf;
}
