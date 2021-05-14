{
  description = "A very basic flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachSystem flake-utils.lib.allSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree {
          flake-repl = pkgs.writeShellScriptBin "repl" ''
            confnix=$(mktemp)
            echo "builtins.getFlake (toString $(git rev-parse --show-toplevel))" >$confnix
            trap "rm $confnix" EXIT
            nix repl $confnix
          '';
        };
        apps.repl = flake-utils.lib.mkApp {
          drv = packages.flake-repl;
        };
        defaultApp = apps.repl;
      });
}
