{ pkgs, ... }:

{
  services.synergy = {
    server.enable = true;	
    server.autoStart = true;
    server.address = "0.0.0.0";
    server.screenName = "galactica";
    server.configFile = pkgs.writeTextFile {
      name = "synergy.conf";
      text = ''
        section: screens
          	galactica:
        	caprica:
        end
        section: links
        	galactica:
        		left = caprica
		caprica:
			right = galactica
        end
      '';
    };
  };

}



