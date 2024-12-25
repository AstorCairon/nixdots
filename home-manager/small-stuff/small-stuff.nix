{config, lib, pkgs, inputs, ...}:
{
  programs.btop.enable = true;
            
  programs.git = {
   enable = true;
   userName = "Astor Cairon";
   userEmail = "galako.irina@gmail.com";
  }; 

  programs.bat.enable = true;

}
