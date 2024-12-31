{ pkgs, ... }: 
{
   services.hypridle = {
     enable = true;
     settings = {
     listener = [{
         timeout = 240;
         on-timeout = "hyprlock";
       }];
     };
   };
}
