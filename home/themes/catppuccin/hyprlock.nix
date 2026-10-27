{ pkgs, ... }:

let
  variables = {
    accent = "rgb(f5c2e7)";
    accentPango = "##f5c2e7";
    base = "rgb(1e1e2e)";
    text = "rgb(cdd6f4)";
    textPango = "##cdd6f4";
    surface0 = "rgb(313244)";
    red = "rgb(f38ba8)";
    yellow = "rgb(f9e2af)";
    font = "Fira Code";
  };
  images = pkgs.callPackage ../images.nix { };
in
{
  # ── Hyprlock ──────────────────────────────────────────────────────────
  programs.hyprlock.settings = {

    general = {
      hide_cursor = true;
      ignore_empty_input = true;
    };

    animations.enabled = false;

    background = {
      monitor = "";
      path = "${images.lock}";
      blur_passes = 0;
      color = variables.base;
    };

    label = [
      # ── Time ──────────────────────────────────────────────────────────────
      {
        monitor = "";
        text = "$TIME";
        color = variables.text;
        font_size = 90;
        font_family = variables.font;
        position = "-30, 0";
        halign = "right";
        valign = "top";
      }

      # ── Date ──────────────────────────────────────────────────────────────
      {
        monitor = "";
        text = "cmd[update:43200000] date +'%A, %d %B %Y'";
        color = variables.text;
        font_size = 25;
        font_family = variables.font;
        position = "-30, -150";
        halign = "right";
        valign = "top";
      }

      # ── Fingerprint ───────────────────────────────────────────────────────
      {
        monitor = "";
        text = "$FPRINTPROMPT"; # TODO: No output yet check again
        color = variables.text;
        font_size = 14;
        font_family = variables.font;
        position = "0, -107";
        halign = "center";
        valign = "center";
      }
    ];

    image = {
      monitor = "";
      path = "${images.face}";
      size = 100;
      border_color = variables.accent;
      position = "0, 75";
      halign = "center";
      valign = "center";
    };

    input-field = {
      monitor = "";
      size = "300, 60";
      outline_thickness = 4;
      dots_size = 0.2;
      dots_spacing = 0.2;
      dots_center = true;
      outer_color = variables.accent;
      inner_color = variables.surface0;
      font_color = variables.text;
      fade_on_empty = false;
      placeholder_text = "<span foreground='${variables.textPango}'><i>󰌾 Logged in as </i><span foreground='${variables.accentPango}'>$USER</span></span>";
      hide_input = false;
      check_color = variables.accent;
      fail_color = variables.red;
      fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
      capslock_color = variables.yellow;
      position = "0, -47";
      halign = "center";
      valign = "center";
    };
  };
}
