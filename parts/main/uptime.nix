{ pkgs, ... }:
{
  systemd.timers."uptime" = {
  wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1m";
      OnUnitActiveSec = "1m";
      Unit = "uptime.service";
          Persistent = true; 
    };
};

systemd.services."uptime" = {
#  script = ''
 #   set -eu
 #   ${pkgs.curl}/bin/curl $(cat ~/.uptime-url)
#  '';
   script = ''CURL_BIN=${pkgs.curl} ${pkgs.bash}/bin/bash /home/neon/uptime.sh'';
  serviceConfig = {
    Type = "oneshot";
    User = "neon";
  };
};

}