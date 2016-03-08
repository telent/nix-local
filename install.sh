#!/usr/bin/env sh
NIX_LOCAL=$HOME/nix-local/
NIXPKGS_CONFIG=$NIX_LOCAL/config.nix nix-env -I nixpkgs=/home/dan/nixenpkgs/ -r -f $NIX_LOCAL/desktop.nix -i desktop

