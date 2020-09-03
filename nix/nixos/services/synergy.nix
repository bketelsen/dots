{ pkgs, ... }:

{

  environment.etc."synergy-server.conf" = { text = ''
	section: screens
		galactica:
		caprica:
	end
	section: links
		caprica:
			right = galactica
		galactica:
			left = caprica
	end
  ''; };

    services.synergy.server = {
      enable = true;
      autoStart = false;
      screenName = "galactica";
      address = "0.0.0.0";
    };

}



