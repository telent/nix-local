{ self, fetchurl, fetchgit ? null, lib }:

{
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
  by-spec."posix-argv-parser"."~0.4.2" =
    self.by-version."posix-argv-parser"."0.4.2";
  by-version."posix-argv-parser"."0.4.2" = self.buildNodePackage {
    name = "posix-argv-parser-0.4.2";
    version = "0.4.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/posix-argv-parser/-/posix-argv-parser-0.4.2.tgz";
      name = "posix-argv-parser-0.4.2.tgz";
      sha1 = "7ac7f896c2de56c16d5543966d803c3798ccd7f3";
    };
    deps = {
      "when-1.3.0" = self.by-version."when"."1.3.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "posix-argv-parser" = self.by-version."posix-argv-parser"."0.4.2";
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
  by-spec."when"."https://github.com/cujojs/when/tarball/1.3.0" =
    self.by-version."when"."1.3.0";
  by-version."when"."1.3.0" = self.buildNodePackage {
    name = "when-1.3.0";
    version = "1.3.0";
    bin = false;
    src = fetchurl {
      url = "https://github.com/cujojs/when/tarball/1.3.0";
      name = "when-1.3.0.tgz";
      sha256 = "980055486d35ed01dd101d453322a762dc8356e87f0ad1f02962b512c682b6fe";
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
