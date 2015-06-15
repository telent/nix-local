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
  by-spec."async"."~0.2.0" =
    self.by-version."async"."0.2.10";
  by-version."async"."0.2.10" = self.buildNodePackage {
    name = "async-0.2.10";
    version = "0.2.10";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/async/-/async-0.2.10.tgz";
      name = "async-0.2.10.tgz";
      sha1 = "b6bbe0b0674b9d719708ca38de8c237cb526c3d1";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "async" = self.by-version."async"."0.2.10";
  by-spec."ctype"."0.5.4" =
    self.by-version."ctype"."0.5.4";
  by-version."ctype"."0.5.4" = self.buildNodePackage {
    name = "ctype-0.5.4";
    version = "0.5.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ctype/-/ctype-0.5.4.tgz";
      name = "ctype-0.5.4.tgz";
      sha1 = "5cfffbc266442ce8a1239a5f37091a085b7a3e6e";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."ejs"."*" =
    self.by-version."ejs"."2.3.1";
  by-version."ejs"."2.3.1" = self.buildNodePackage {
    name = "ejs-2.3.1";
    version = "2.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ejs/-/ejs-2.3.1.tgz";
      name = "ejs-2.3.1.tgz";
      sha1 = "a697d98ac401e32a99c3deed92c60c19b6199a7f";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jstest"."*" =
    self.by-version."jstest"."1.0.5";
  by-version."jstest"."1.0.5" = self.buildNodePackage {
    name = "jstest-1.0.5";
    version = "1.0.5";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/jstest/-/jstest-1.0.5.tgz";
      name = "jstest-1.0.5.tgz";
      sha1 = "e09da1e1d6a1c28b63afd952d3dd7a98c5d86027";
    };
    deps = {
      "nopt-3.0.2" = self.by-version."nopt"."3.0.2";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "jstest" = self.by-version."jstest"."1.0.5";
  by-spec."mkdirp"."~0.3.0" =
    self.by-version."mkdirp"."0.3.5";
  by-version."mkdirp"."0.3.5" = self.buildNodePackage {
    name = "mkdirp-0.3.5";
    version = "0.3.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.3.5.tgz";
      name = "mkdirp-0.3.5.tgz";
      sha1 = "de3e5f8961c88c787ee1368df849ac4413eca8d7";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "mkdirp" = self.by-version."mkdirp"."0.3.5";
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
  by-spec."posix-argv-parser"."~1.0.0" =
    self.by-version."posix-argv-parser"."1.0.2";
  by-version."posix-argv-parser"."1.0.2" = self.buildNodePackage {
    name = "posix-argv-parser-1.0.2";
    version = "1.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/posix-argv-parser/-/posix-argv-parser-1.0.2.tgz";
      name = "posix-argv-parser-1.0.2.tgz";
      sha1 = "f43db33e62a94f80d946c9deccebda0176c5be76";
    };
    deps = {
      "when-1.8.1" = self.by-version."when"."1.8.1";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "posix-argv-parser" = self.by-version."posix-argv-parser"."1.0.2";
  by-spec."posix-getopt"."1.1.0" =
    self.by-version."posix-getopt"."1.1.0";
  by-version."posix-getopt"."1.1.0" = self.buildNodePackage {
    name = "posix-getopt-1.1.0";
    version = "1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/posix-getopt/-/posix-getopt-1.1.0.tgz";
      name = "posix-getopt-1.1.0.tgz";
      sha1 = "8e258aca8f34d6906c159a32b0388360197e5698";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."pw"."~0.0.4" =
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
  by-spec."remotestorage-oauth"."~0.2.0" =
    self.by-version."remotestorage-oauth"."0.2.0";
  by-version."remotestorage-oauth"."0.2.0" = self.buildNodePackage {
    name = "remotestorage-oauth-0.2.0";
    version = "0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/remotestorage-oauth/-/remotestorage-oauth-0.2.0.tgz";
      name = "remotestorage-oauth-0.2.0.tgz";
      sha1 = "c302ff3655b885f32a9307ca1a7f54e1ad7d935a";
    };
    deps = {
      "ejs-2.3.1" = self.by-version."ejs"."2.3.1";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "remotestorage-oauth" = self.by-version."remotestorage-oauth"."0.2.0";
  by-spec."ssh-agent"."~0.2.1" =
    self.by-version."ssh-agent"."0.2.3";
  by-version."ssh-agent"."0.2.3" = self.buildNodePackage {
    name = "ssh-agent-0.2.3";
    version = "0.2.3";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/ssh-agent/-/ssh-agent-0.2.3.tgz";
      name = "ssh-agent-0.2.3.tgz";
      sha1 = "74ac9ffad6b7eca3c1674686b5613824243f86a9";
    };
    deps = {
      "ctype-0.5.4" = self.by-version."ctype"."0.5.4";
      "posix-getopt-1.1.0" = self.by-version."posix-getopt"."1.1.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "ssh-agent" = self.by-version."ssh-agent"."0.2.3";
  by-spec."vault-cipher"."~0.3.0" =
    self.by-version."vault-cipher"."0.3.1";
  by-version."vault-cipher"."0.3.1" = self.buildNodePackage {
    name = "vault-cipher-0.3.1";
    version = "0.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/vault-cipher/-/vault-cipher-0.3.1.tgz";
      name = "vault-cipher-0.3.1.tgz";
      sha1 = "782e6a50585347c30371869d26cd80136502a45d";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "vault-cipher" = self.by-version."vault-cipher"."0.3.1";
  by-spec."when"."https://github.com/cujojs/when/tarball/1.8.1" =
    self.by-version."when"."1.8.1";
  by-version."when"."1.8.1" = self.buildNodePackage {
    name = "when-1.8.1";
    version = "1.8.1";
    bin = false;
    src = fetchurl {
      url = "https://github.com/cujojs/when/tarball/1.8.1";
      name = "when-1.8.1.tgz";
      sha256 = "4118d22d687645bb64f3d58da3ac7374812e5346405b22f3b80b691aee713c8e";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
}
