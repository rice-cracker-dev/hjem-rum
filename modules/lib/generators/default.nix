{lib}: {
  environment = import ./environment.nix {inherit lib;};
  gtk = import ./gtk.nix {inherit lib;};
  hypr = import ./hypr.nix {inherit lib;};
  kitty = import ./kitty.nix {inherit lib;};
  ncmpcpp = import ./ncmpcpp.nix {inherit lib;};
}
