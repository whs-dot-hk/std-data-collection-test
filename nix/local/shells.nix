let
  inherit (inputs) std-data-collection;
  inherit (inputs.std.lib.dev) mkNixago;
  inherit (inputs.std.lib.dev) mkShell;
in {
  default = mkShell {
    nixago = with std-data-collection.data.configs; [
      (mkNixago treefmt)
    ];
  };
}
