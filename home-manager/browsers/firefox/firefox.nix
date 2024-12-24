{config, lib, pkgs, inputs, ... }: 
{
  programs.firefox = { 
     enable = true;
     profiles.astor = {

       search.engines = {};

       userChrome = ''

         /* insert css */
       '';

       settings = {
         "identity.fxaccounts.enabled" = false;
         "browser.download.panel.shown" = true;
	 "dom.security.https_only_mode" = true;
	 "signon.rememberSignons" = false;
       }; 
		

       bookmarks = [
         {
            name = "wikipedia";
	    tags = [ "wiki" ];
	    keyword = "wiki";
	    url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
         }
       ];
 
     };

    
   };

}
