sudo nixos-rebuild switch --flake .#nixosPC
# if perms are 777 then it should be fine
sudo chmod -R 777 /etc/nixos