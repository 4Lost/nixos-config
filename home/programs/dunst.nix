{ ... }:

{
  services.dunst = {
    enable = true;
    # settings = {
    #   global = {
    #     # Your exact styling - unchanged
    #     monitor = 1;
    #     origin = "top-right";
    #     offset = "15x25";
    #     width = 300;
    #     height = 100;
    #     gap_size = 5;
    #     notification_limit = 5;
    #     # font removed as requested
    #     frame_width = 1;
    #     separator_color = "frame";
    #     corner_radius = 12;
    #     corners = "top-left,bottom";
    #     progress_bar_corner_radius = 8;
    #     progress_bar_corners = "top-left,bottom-right";
    #     timeout = 5;
    #     idle_threshold = 120;
    #     max_icon_size = 64;
    #     enable_recursive_icon_lookup = true;
    #     show_indicators = true;
    #     sticky_history = true;
    #     history_length = 20;
    #     mouse_left_click = "close_current";
    #     mouse_right_click = "close_all";
    #     mouse_middle_click = "context_all";
    #     format = "<b>%a</b>\\n%s\\n<i>%b</i>";
    #   };
    #
    #   urgency_low = {
    #     timeout = 3;
    #   };
    #
    #   urgency_normal = {
    #     timeout = 5;
    #   };
    #
    #   urgency_critical = {
    #     timeout = 0;
    #   };
    # };
  };
}
