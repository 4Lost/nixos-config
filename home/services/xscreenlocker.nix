{ pkgs, ... }:

let images = pkgs.callPackage ../extras/images.nix { };
in {
  home.packages = with pkgs; [ xsecurelock ];

  home.sessionVariables = rec {
    XSECURELOCK_COMPOSITE_OBSCURER = 0;
    XSECURELOCK_PASSWORD_PROMPT = "asterisks";
  };

  services.screen-locker = {
    enable = true;
    inactiveInterval = 1;
    lockCmd = "${pkgs.xsecurelock}/bin/xsecurelock";
    xautolock.extraOptions = [ "Xautolock.killer: systemctl suspend" ];
  };
}

