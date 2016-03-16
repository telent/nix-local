# NIXPKGS_CONFIG=$HOME/nix-local/config.nix nix-env -r -f $HOME/nix-local/desktop.nix -i desktop
# need to add
#  https://raw.githubusercontent.com/telent/dotfiles/master/.gtkrc-2.0
#  and .gitconfig would be nice too
with import <nixpkgs> {};
let linuxPaths = [
    acpi
    cdrkit
    firefox
    gimp
    jwhois
    mupdf
    sawfish
    tcpdump
    usbutils
    vimNox
    wayland
    weston
    wireshark
    xterm
  ];
  darwinPaths = [];
  commonPaths = [
    binutils
    emacs
    file
    git
    gnumake
    iftop
    manpages
    nmap
    nodejs_vault
    python
    python27Packages.pip
    tmux
    unzip
  ];
in buildEnv {
  name = "desktop";
  paths = commonPaths ++
  (stdenv.lib.optionals stdenv.isDarwin darwinPaths) ++
  (stdenv.lib.optionals stdenv.isLinux linuxPaths) ;

}
