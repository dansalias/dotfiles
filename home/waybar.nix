{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        modules-left = [
          "disk"
          "memory"
          "cpu"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "network"
          "bluetooth"
          "pulseaudio"
          "backlight"
          "battery"
        ];
        disk = {
          "interval" = 5;
          "format" = "<span color='#777'>hdd:</span> {percentage_used}%";
        };
        memory = {
          "interval" = 1;
          "format" = "<span color='#777'>mem:</span> {percentage}%";
        };
        cpu = {
          "interval" = 1;
          "format" = "<span color='#777'>cpu:</span> {usage}%";
        };
        clock = {
          "interval" = 1;
          "format" = "{:%a %b %d - %H:%M}";
          "format-alt" = "{:%Y-%m-%d %H:%M:%S (%Z/UTC%z)}";
          "tooltip" = false;
        };
        network = {
          "format" = "<span color='#777'>net:</span> {essid}";
        };
        bluetooth = {
          "format" = "<span color='#777'>bt:</span> {num_connections}";
        };
        pulseaudio = {
          "format" = "<span color='#777'>vol:</span> {volume}%";
        };
        backlight = {
          "format" = "<span color='#777'>bl:</span> {percent}%";
        };
        battery = {
          "format" = "<span color='#777'>bat:</span> {capacity}%";
        };
      };
    };

    style = ''
      * {
        font: 0.75rem 'Hack', monospace;
      }

      window#waybar {
        background: none;
        color: #abaca6;
      }

      label.module {
        padding: 0.3rem 0.5rem 0.16rem;
      }
    '';
  };
}
