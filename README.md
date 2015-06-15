# Local packages for Nix

I don't yet know what I'm doing with Nix well enough to be pushing
packages upstream, so I don't want to be maintinaing a local fork 
of the nixpkgs repo.

What I did instead is put this in my `.nixpkgs/config.nix`.
`packageOverrides` is (as far as I can work out) a function that
should accept a set of packages and return another set of packages:
nixpkgs calls it with the set of all available packages and merges
whatever it returns onto the same set.


```
{
  packageOverrides = pkgs: {
    vault = pkgs.callPackage /Users/dbarlow/nix-local/vault {};
  };
}
```
