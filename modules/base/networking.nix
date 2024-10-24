{ config, lib, pkgs, ...}:
{
  networking.hostName = "Toaster";

  services.openssh.enable = false;
  #networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = false;
    enableSSHSupport = false;
  };

  networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 587 993 995 9001 9030 ];
  allowedUDPPorts = [ 53 123 161 67 68 5353 ];
  allowedUDPPortRanges = [
    { from = 8000; to = 8010; }
    { from = 50000; to = 65535; }
    { from = 9050;  to = 9051; }
    #{from = 6000; to 6063; } open this range if you need remote access (such as over SSH) to X11 applications
  ];
};

  }
