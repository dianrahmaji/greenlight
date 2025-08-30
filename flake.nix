{
  description = "Greenlight project's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        go-migrate-pg = pkgs.go-migrate.overrideAttrs (oldAttrs: {
          tags = ["postgres"];
        });
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
			go
            go-migrate-pg
			hey
          ];
		  shellHook = ''
			zsh
		  '';
        };
      }
    );
}
