{ config, pkgs, ... }:

{
  home.packages = (with pkgs; [ discord slack signal-desktop zoom ]);
}