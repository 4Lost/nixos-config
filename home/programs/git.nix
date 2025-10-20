{ ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "4Lost";
      email = "elias.schroeter@e.email";
    };
    signing = {
      key = "0x99D2EF975FE523CC";
      signByDefault = false;
    };
  };
}
