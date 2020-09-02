{ config, pkgs, ... }:

{
  
  home.packages = (with pkgs; [ firefox google-chrome-dev ]);
}
