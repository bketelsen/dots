{ pkgs, ... }:

{

  fonts = {
    enableFontDir = true;

    fonts = with pkgs; [
      cascadia-code
      corefonts
      emojione
      font-awesome
      google-fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];


  };

}






