let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    git
    zsh
    ripgrep
    fd
    bat
    fzf
    jq
    curl
    wget
    tree
    elixir_1_16
  ];
}
