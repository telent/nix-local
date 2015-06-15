# Local packages for Nix

## Contents

* vault: " Generates safe passwords so you never need to remember them
" from https://github.com/jcoglan/vault

## Installation

I don't want to maintain a local fork of the nixpkgs repo with my
personal packages, at least unless and until I think it's worth trying
to get them merged.

What I did instead is put this in my `.nixpkgs/config.nix`.
`packageOverrides` is (as far as I can work out) a function that
should accept a set of packages and return another set of packages:
nixpkgs calls it with the set of all available packages and merges
whatever it returns onto the same set.


```
{
  packageOverrides = pkgs: {
    vault = pkgs.callPackage /Users/dbarlow/nix-local/vault {};
    # repeat for each package herein
  };
}
```

## Implementation notes

### Vault

As of June 2015, upstream 'master' doesn't install with `npm install`
because it is missing dependencies.  According to `git bisect` this is
the latest available version that does

I started by running 

```
`nix-build '<nixpkgs>' -A npm2nix`/bin/npm2nix package.json node-packages.generated.nix
```

but the generated default.nix seems to need significant manual editing:

* first it gave me `Assertion failed: (!s.empty()), function showId, file src/libexpr/nixexpr.cc, line 33.` which seemed to be related to the definition of `tarball`.  I replaced this with `fetchFromGitHub`

* the `deps` definition in the gnerated expression produced errors about unknown attributes, so I replaced that line with

```
deps = (filter (v: nixType v == "derivation") (attrValues nodePackages))
```

