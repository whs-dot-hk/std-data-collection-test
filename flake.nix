{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.std-data-collection.url = "github:divnix/std-data-collection";
  inputs.std.url = "github:divnix/std";

  inputs.std-data-collection.inputs.nixpkgs.follows = "nixpkgs";
  inputs.std-data-collection.inputs.std.follows = "std";
  inputs.std.inputs.devshell.url = "github:numtide/devshell";
  inputs.std.inputs.nixago.url = "github:nix-community/nixago";

  outputs = {
    self,
    std,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (devshells "shells")
      ];
    }
    {
      devShells = std.harvest self ["local" "shells"];
    };
}
