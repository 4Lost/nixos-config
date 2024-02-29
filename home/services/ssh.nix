{ ... }:

{
  services = {
    ssh-agent = {
      enable = true;
    };
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "prohibit-password";
      };
    };
  };
}

