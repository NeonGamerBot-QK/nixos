## My robot for ssh access mostly.
{ pkgs, ... }:
{
       users.groups.zeon = {};
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zeon = {
    isSystemUser = true;
    description = "Zeon (bot)";
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$y$j9T$qzfdCskx/alpliRS9UXiT1$DaqY3cNO3/ll1uIYFtfKiEZBijj.OhhazOs85clr6T5";
group = "zeon";
    openssh = {
      authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7cswy2R++OjM9Zo9cnAIiyVQ1AyXnCgVa8LBDwl2ceGBdn0pP+PSQJBB/RACEH2u9sfwa/IyohnojCY5/4rNmoyeqIZFTLGUQ0YVCTDkJm5MhLrWnrLgGuGWozjotbPTGxZI9etgvdjUnsqMqTXx5goa/FLlzpcA3KKMZMXW281hL1I0h16O4c9xFXVYUnwvg/toN1QNWnCCS7Ek8ujrr7P/j2G8QL618KP94NII4TV8KvAfI6piANci81IgDxSCpRnjwNC4lZJ6upJZ3begogxTs1WvVjMV7XCQnquCizv9t7xO4t5K9Ftp7zBgGuDIZi6wzaWYmGdcY+aEEdCWCz3boNeDzO6oN66RJv/BSWqAqwW0GDMwURgDEGzQu0RwPUjOqagkVGSLVArKX5DsM9dRAEzwrcYfgd4Url5Mpgc0q3l7L41+wDihWlcQi5/cb3fw/lOb8Mm4iAWYxuGRrrkFrYZpeJy/5eyDme25LoDKOPJteAVkrDb9ytgFJhy8="
  ];
    };
  }; 
}