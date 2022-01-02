{
  description = "My website";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs?ref=master;
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: 
    let
    pkgsForSystem = system: import nixpkgs {
        overlays = [ overlay ];
        inherit system;
      };

    overlay = final: prev: rec {

      website = with final;
        let
          beamPackages = beam.packagesWith beam.interpreters.erlangR24; 
          mixNixDeps = import ./deps.nix { inherit lib beamPackages; };
          npm = nodePackages.npm;
        in beamPackages.mixRelease {
          inherit mixNixDeps npm;
          pname = "website";
          src = ./.;
          version = "0.0.0";
          RELEASE_DISTRIBUTION = "none";
          
          postBuild = ''
            mix do deps.loadpaths --no-deps-check

            mix assets.deploy
          '';
         };
    };
    in utils.lib.eachDefaultSystem (system: rec {
      legacyPackages = pkgsForSystem system;
      packages = utils.lib.flattenTree {
        inherit (legacyPackages) website;
      };
      defaultPackage = packages.website;
      devShell = self.devShells.${system}.dev;
      devShells = {
        dev = import ./shell.nix {
          pkgs = legacyPackages;
          db_name = "db_dev";
          MIX_ENV = "dev";
        };
        test = import ./shell.nix {
          pkgs = legacyPackages;
          db_name = "db_test";
          MIX_ENV = "test";
        };
        prod = import ./shell.nix {
          pkgs = legacyPackages;
          db_name = "db_prod";
          MIX_ENV = "prod";
        };
      };
      apps.website = utils.lib.mkApp { drv = packages.website; };
      hydraJobs = { inherit (legacyPackages) website; };
      checks = { inherit (legacyPackages) website; };
    }) // { overlay = overlay ;};
}
