-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/configuring/core/autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
    -- 1. Export variables to the systemd/d-bus environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- 2. Launch the Polkit binary directly
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")

    -- 3. Start the Gnome Keyring
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,ssh")

    -- 4.Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    hl.exec_cmd("hypridle")
end)