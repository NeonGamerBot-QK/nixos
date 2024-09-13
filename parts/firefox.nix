{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    # You can specify the Firefox package version if you want a specific one
    package =  pkgs.firefox-bin;
   # Enable or disable various features
  #  settings = {
      # Specify the Firefox user profile directory if needed
    #   userProfile = "${pkgs.xdg.config.home}/firefox";

      # Add other settings here
 #     preferences = {
 #       "browser.startup.homepage" = "https://www.example.com";
 #       "privacy.trackingprotection.enabled" = true;
 #     };
  #  };

    # Example of setting up a custom user agent
 #   userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36";

   };

  # Optional: Enable or configure other Firefox-related programs
#   programs.firefox-wayland.enable = true;
}
