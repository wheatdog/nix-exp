{ pkgs ? import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; } }:

with pkgs;

let
  dnsrobocert = callPackage ./dnsrobocert { };
  py-env = python3.withPackages (ps: 
      with ps; [
          dns-lexicon
          pytest
          pytestcov
          pytest_xdist
          vcrpy
          mock
          flake8
          isort
          tox
          black
  ]);
in mkShell {
    buildInputs = [
        py-env
        dnsrobocert
    ];
}
