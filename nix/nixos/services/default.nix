{ imports = [ 
            ./avahi.nix 
            ./synergy.nix
            ./yubikey.nix
            ]; 
            



services.printing.enable = true;

services.openssh.enable = true;

# network browsing
services.gvfs.enable = true;            
  
#onedrive 
services.onedrive.enable = true;
}
