{ config, pkgs, ... }:
with import <nixpkgs> {};
with builtins;
with lib;

{
  home.file = {

  # spacemacs
  ".emacs.d" = {
     source = fetchFromGitHub {
    	owner = "syl20bnr";
    	repo = "spacemacs";
    	rev = "a0728abf1a06c8f46c265ef298b764d500cbb8f0";
    	sha256 = "06id8ffi0ijgk0qyiknj3vi0hd1lqfv5qlkpzz2dbz0vq9x3j2rk";
     };
     recursive = true;
  }; 

  ".spacemacs".source = ./spacemacs;
  ".profile".source = ./profile;

  };
}
