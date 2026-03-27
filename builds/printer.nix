{ pkgs, ... }:

{
  services.printing.drivers = [ pkgs.epson-escpr ];
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Epson-XP-520";
        location = "Home";
        deviceUri = "usb://EPSON/XP-520%20Series?serial=554656593133323698&interface=1";
        model = "epson-inkjet-printer-escpr/Epson-XP-520_Series-epson-escpr-en.ppd";
        ppdOptions = {
          PageSize = "A4";
          Ink = "Color";
        };
      }
    ];
    ensureDefaultPrinter = "Epson-XP-520";
  };
}
