{ self, fetchurl, fetchgit ? null, lib }:

{
  by-spec."abbrev"."1" =
    self.by-version."abbrev"."1.0.7";
  by-version."abbrev"."1.0.7" = self.buildNodePackage {
    name = "abbrev-1.0.7";
    version = "1.0.7";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/abbrev/-/abbrev-1.0.7.tgz";
      name = "abbrev-1.0.7.tgz";
      sha1 = "5b6035b2ee9d4fb5cf859f08a9be81b208491843";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jsclass"."*" =
    self.by-version."jsclass"."4.0.5";
  by-version."jsclass"."4.0.5" = self.buildNodePackage {
    name = "jsclass-4.0.5";
    version = "4.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jsclass/-/jsclass-4.0.5.tgz";
      name = "jsclass-4.0.5.tgz";
      sha1 = "72257b324ea4774c781f0d67d3e243599dda1d0c";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "jsclass" = self.by-version."jsclass"."4.0.5";
  by-spec."nopt"."*" =
    self.by-version."nopt"."3.0.2";
  by-version."nopt"."3.0.2" = self.buildNodePackage {
    name = "nopt-3.0.2";
    version = "3.0.2";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/nopt/-/nopt-3.0.2.tgz";
      name = "nopt-3.0.2.tgz";
      sha1 = "a82a87f9d8c3df140fe78fb29657a7a774403b5e";
    };
    deps = {
      "abbrev-1.0.7" = self.by-version."abbrev"."1.0.7";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "nopt" = self.by-version."nopt"."3.0.2";
  by-spec."pw".">=0.0.4" =
    self.by-version."pw"."0.0.4";
  by-version."pw"."0.0.4" = self.buildNodePackage {
    name = "pw-0.0.4";
    version = "0.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/pw/-/pw-0.0.4.tgz";
      name = "pw-0.0.4.tgz";
      sha1 = "8015982ef8bebfd9d8eb8c795e751774871fde46";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "pw" = self.by-version."pw"."0.0.4";
}
