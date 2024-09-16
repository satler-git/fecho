{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    stdenv = pkgs.stdenv;
  in rec {

    packages.x86_64-linux.fecho = stdenv.mkDerivation {

    };

    packages.x86_64-linux.default = packages.x86_64-linux.fecho;

    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        cargo
        rustc
        xdotool
        libxkbcommon
      ];
    };
  };
}
