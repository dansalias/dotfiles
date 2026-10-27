{
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      input = {
        keyboard = {
          xkb = {
            options = "ctrl:nocaps,compose:ralt";
          };
        };
        touchpad = { tap = {}; };
        touch = { off = {}; };
        focus-follows-mouse = {};
      };

      gestures = {
        hot-corners = { off = {}; };
      };

      layout = {
        gaps = 2;
        focus-ring = { off = {}; };
        border = { off = {}; };
        background-color = "transparent";
        default-column-width = {
          proportion = 1.0;
        };
        always-center-single-column = {};
      };

      prefer-no-csd = {};

      screenshot-path = "~/tmp/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png";

      overview = {
        workspace-shadow = {
          off = {};
        };
      };

      cursor = {
        xcursor-theme = "phinger-cursors-dark";
        xcursor-size = 24;
      };

      binds = {
        # general
        "Mod+Slash".show-hotkey-overlay = {};
        "Mod+E".quit = {};
        "Mod+Q".close-window = {};
        "Mod+C".center-column = {};
        "Mod+O" = {
          _props.repeat = false;
          toggle-overview = {};
        };

        # navigation
        "Mod+H".focus-column-left = {};
        "Mod+J".focus-window-or-workspace-down = {};
        "Mod+K".focus-window-or-workspace-up = {};
        "Mod+L".focus-column-right = {};

        # sizing
        "Mod+R".switch-preset-column-width = {};

        # screenshots
        "Mod+S".screenshot = {};
        "Mod+Ctrl+S".screenshot-screen = {};
        "Mod+Shift+S".screenshot-window = {};

        # apps
        "Mod+Return" = {
          _props.hotkey-overlay-title = "New Terminal";
          spawn = "foot";
        };
        "Mod+Shift+Return" = {
          _props.hotkey-overlay-title = "New Terminal in cwd";
          spawn-sh = "foot -D $(ycwd $(niri msg focused-window | awk '/PID/ {print $2}'))";
        };
        "Mod+B" = {
          _props.hotkey-overlay-title = "New Browser";
          spawn = "chromium --show-avatar-button=never";
        };
        "Mod+Shift+B" = {
          _props.hotkey-overlay-title = "New Private Browser";
          spawn = "chromium --show-avatar-button=never --incognito";
        };
      };

      _children = [
        {
          layer-rule._children = [
            { match._props = { namespace = "^wallpaper$"; }; }
            { place-within-backdrop = true; }
          ];
        }
        {
          window-rule._children = [
            { match._props = { app-id = "foot"; }; }
            { exclude._props = { is-focused = true; }; }
            { opacity = 0.9; }
          ];
        }
        {
          output = {
            _args = ["eDP-1"];
            scale = 2;
          };
        }
        {
          output = {
            _args = ["DP-1"];
            mode = "3440x1440";
            layout = {
              default-column-width = {
                proportion = 0.333333;
              };
              preset-column-widths = {
                _children = [
                  { proportion = 0.2; }
                  { proportion = 0.4; }
                  { proportion = 0.6; }
                  { proportion = 1.0; }
                ];
              };
            };
          };
        }
      ];
    };
  };
}
