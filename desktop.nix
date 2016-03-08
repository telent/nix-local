# NIXPKGS_CONFIG=$HOME/nix-local/config.nix nix-env -r -f $HOME/nix-local/desktop.nix -i desktop
# need to add
#  https://raw.githubusercontent.com/telent/dotfiles/master/.gtkrc-2.0
#  and .gitconfig would be nice too
with import <nixpkgs> {};
buildEnv {
    name = "desktop";
    paths = [ emacs
	firefox xterm git vimNox cdrkit
        unzip gnumake iftop wireshark tcpdump acpi
	tmux
        wayland weston
        gimp manpages
        jwhois
        nmap
        nodejs_vault
	sawfish mupdf
	file usbutils python binutils python27Packages.pip ] ;
}
