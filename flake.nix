{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    stdenv = pkgs.stdenv;
  in{
    packages.x86_64-linux.fecho_cli = stdenv.mkDerivation {

    };

    packages.x86_64-linux.fcitx5-fecho = stdenv.mkDerivation rec {
      buildInputs = with pkgs; [
        fcitx5
        fcitx5-lua
      ];
    };

    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        luajitPackages.luarocks
        luajitPackages.luarocks-nix
        luajit
        stylua

        cargo
        rustc
      ];
    };
  };
}
