{ pkgs, ... }:

{
  services.printing.drivers = [ pkgs.epson-escpr ];
  hardware.printers = {
    ensurePrinters = [{
      name = "Epson-XP-520";
      location = "Home";
      deviceUri = "http://192.168.178.34:631/ipp/print";
      model =
        "epson-inkjet-printer-escpr/Epson-XP-520_Series-epson-escpr-en.ppd";
      ppdOptions = {
        PageSize = "A4";
        Ink = "Mono";
      };
    }];
    ensureDefaultPrinter = "Epson-XP-520";
  };
}
