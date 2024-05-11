{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ autorandr ];

  programs.autorandr = {
    enable = true;
    profiles = {
      "desktop-dual" = {
        fingerprint = {
          "DVI-D-1" =
            "00ffffffffffff0010ac9940423948442d18010380331d78eae595a656529d27105054a54b00714f8180a9c0d1c00101010101010101023a801871382d40582c4500fd1e1100001e000000ff004a384a3331344234444839420a000000fc0044454c4c205032333134480a20000000fd00384c1e5311000a202020202020007f";
          "HDMI-2" =
            "00ffffffffffff000469fa22010101012f17010380301b78ea3d25a35951a0250f5054bfef00714f818081409500a940b300d1c00101023a801871382d40582c4500dd0c1100001e000000fd00324c1e5311000a202020202020000000fc0056453232380a20202020202020000000ff0044424c4d51533037343531360a013402031ef14b900504030201111213141f230907078301000065030c0010001a3680a070381e4030203500dd0c1100001a662156aa51001e30468f3300dd0c1100001e011d007251d01e206e285500dd0c1100001e8c0ad08a20e02d10103e9600dd0c11000018011d8018711c1620582c2500dd0c1100009f0000000000000032";
        };
        config = {
          "HDMI-2" = {
            enable = true;
            primary = true;
            position = "1920x0";
            mode = "1920x1080";
            #gamma = "1.0:0.909:0.833";
            #rate = "60.00";
          };

          "DVI-D-1" = {
            enable = true;
            primary = false;
            position = "0x0";
            mode = "1920x1080";
            #gamma = "1.0:0.909:0.833";
            #rate = "60.00";
          };
        };
      };
    };
  };
}
