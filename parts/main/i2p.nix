{ pkgs, inputs,... }:
{
    environment.systemPackages = with pkgs; [ 
      i2p
    ];
  services.i2pd = {
    enable = true;
     address = "127.0.0.1";
      proto = {
          http.enable = true;
          socksProxy.enable = true;
          httpProxy.enable = true;
        };
  };
}