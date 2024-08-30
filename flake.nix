{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    ,
    }:
    flake-utils.lib.eachDefaultSystem
      (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.cudaSupport = true;
            config.allowUnfree = true;
          };
        in
        {
          devShells = rec {
            cshabi = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
              name = "clangenv";
              buildInputs = with pkgs;
                [
                  pkg-config
                  cmake
                  gdb
                  gnumake
                  fd
                  eza
                  ninja
                  (opencv.override {
                    enableGtk2 = true;
                    enableGtk3 = true;
                    enableVtk = true;
                  })
                  gtk2
                  gtk3
                  cudaPackages.cudatoolkit
                  # zig Support
                  zig
                  zls
                ];
              shellHook = ''
                alias find=fd
                alias ls=eza
              '';
            };
            default = cshabi;
          };
          # flake contents here
        }
      );
}
