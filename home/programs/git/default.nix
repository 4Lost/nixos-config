{ ... }:

{
  programs.git = {
    enable = true;
    userName = "4Lost";
    userEmail = "elias.schroeter@e.email";
    signing = {
      key = "0x99D2EF975FE523CC";
      signByDefault = false;
    };
  };
}
