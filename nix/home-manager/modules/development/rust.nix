{ config, pkgs, ... }:

{
  # Rustup provides cargo, clippy, rls, rustfmt, etc
  home.packages = (with pkgs; [ gcc rust-analyzer rustup wasm-pack ]);
}
