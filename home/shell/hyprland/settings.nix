{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    
    # catppucchin mocha colorscheme
    "$rosewater" 	= "0xfff5e0dc";
    "$flamingo" 	= "0xfff2cdcd";
    "$pink" 		= "0xfff5c2e7";
    "$mauve" 		= "0xffcba6f7";
    "$red" 		= "0xfff38ba8";
    "$maroon"		= "0xffeba0ac";
    "$peach"		= "0xfffab387";
    "$green"		= "0xffa6e3a1";
    "$teal"		= "0xff94e2d5";
    "$sky"		= "0xff89dceb";
    "$sapphire"		= "0xff74c7ec";
    "$blue"		= "0xff89b4fa";
    "$lavender"		= "0xffb4befe";

    "$text"		= "0xffcdd6f4";
    "$subtext1"		= "0xffbac2de";
    "$subtext2"		= "0xffa6adc8";

    "$overlay2"		= "0xff9399b2";
    "$overlay1"		= "0xff7f849c";
    "$overlay0"		= "0xff6c7086";

    "$surface2"		= "0xff585b70";
    "$surface1"		= "0xff45475a";
    "$surface0"		= "0xff313244";

    "$base"		= "0xff1e1e2e";
    "$mantle"		= "0xff181825";
    "$crust"		= "0xff11111b";


    #
    # monitors
    #
    monitor = [
        "eDP-2, 1920x1200@60, 0x0, 1"
    ];

    #
    # variables
    #
    general = {
      "gaps_in" = "4";
      "gaps_out" =" 4";
      "border_size" = "2";
      "col.active_border" = "$pink $lavender $mauve 135deg";
      "col.inactive_border" = "$overlay0 $surface2 $surface0 45deg";
      "layout" = "dwindle";
    };

    input = {
      "kb_layout" = "us";
      "repeat_rate" = "25";
      "repeat_delay" = "500";
      "sensitivity" = "0.3";
      "follow_mouse" = "1";
      touchpad = {
        "disable_while_typing" = "false";
	      "natural_scroll" = "false";
	      "clickfinger_behavior" = "true";
	      "tap-to-click" = "true";
	      "drag_lock" = "false";
      };
    };

    gestures = {
      "workspace_swipe" = "false";
    };

    animations = {
      "enabled" = "true";
      "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "fade, 1, 7, default"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "workspaces, 1, 6, default"
      ];
    };

    decoration = {
      "rounding" = "4";
      blur = {
        "enabled" = "true";
        "size" = "3";
      	"passes" = "1";
	      "new_optimizations" = "true";
      };
    };

    dwindle = {
      "pseudotile" = "true";
      "force_split" = "0";
      "preserve_split" = "true";
    };
    
    #
    # exec
    #
    exec-once = [
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch chiphist store"
      "systemctl --user start hyprpolkitagent"
      "qs"
    ];
    
    #
    # window rules
    #
    windowrule = [
      # xwaylandvideobridge
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
      "nofocus, class:^(xwaylandvideobridge)$"
    ];

    windowrulev2 = [
      # steam
      "nofocus, class:^(steam)$, title:^(notificationtoasts_.*_desktop)$"
      "stayfocused, title:^()$, class:^(steam)$"
      "minsize 1 1, title:^()$, class:^(steam)$"
      
      # firefox p-i-p
      "float, pin, class:^(firefox)$, title:^(Picture-in-Picture)$"

      # fix bitwig sliders and knobs (Issue #2034)
      "nofocus, class:^$, title:^$, xwayland: 1, floating: 1, fullscreen: 0, pinned: 0"
    ];

    #
    # binds
    #

    # bind vars
    "$mainMod" = "SUPER";
    "$shiftMod" = "$mainMod SHIFT";
    "$altMod" = "$mainMod ALT";
    "$ctrlMod" = "$mainMod CTRL";
	
    # normal binds
    bind = [
	    "$shiftMod, M, exit"		# exit Hyprland

	    # window controls
	    "$shiftMod, C, killactive"	# close active		mod+shift+c
     	"$mainMod, V, togglefloating"	# toggle float		mod+v
     	"$mainMod, F, fullscreen, 1"	# fake fullscreen	mod+f
     	"$shiftMod, F, fullscreen, 0"	# reall fullscreen	mod+shift+f
    	"$mainMod, J, togglesplit"	# change split		mod+j
    	"$mainMod, P, pseudo"		# psudeo split		mod+p
    	"$shiftMod, P, pin"		# pin to all workspaces	mod+shift+p

	    # move focus w/ mod + arrow keys
  	  "$mainMod, left, movefocus, l"
  	  "$mainMod, right, movefocus, r"
  	  "$mainMod, up, movefocus, u"
  	  "$mainMod, down, movefocus, d"

	    # move active window w/ mod + shift + arrow keys
  	  "$shiftMod, left, movewindow, l"
  	  "$shiftMod, right, movewindow, r"
  	  "$shiftMod, up, movewindow, u"
  	  "shiftMod, down, movewindow, d"

  	  # switch workspaces w/ mod + [0-9]
  	  "$mainMod, 1, workspace, 1"
  	  "$mainMod, 2, workspace, 2"
  	  "$mainMod, 3, workspace, 3"
  	  "$mainMod, 4, workspace, 4"
  	  "$mainMod, 5, workspace, 5"
  	  "$mainMod, 6, workspace, 6"
  	  "$mainMod, 7, workspace, 7"
  	  "$mainMod, 8, workspace, 8"
  	  "$mainMod, 9, workspace, 9"
  	  "$mainMod, 0, workspace, 10"

	    # move with window to workspace w/ mod + shift + [0-9]
  	  "$shiftMod, 1, movetoworkspace, 1"
  	  "$shiftMod, 2, movetoworkspace, 2"
      "$shiftMod, 3, movetoworkspace, 3"
      "$shiftMod, 4, movetoworkspace, 4"
      "$shiftMod, 5, movetoworkspace, 5"
      "$shiftMod, 6, movetoworkspace, 6"
      "$shiftMod, 7, movetoworkspace, 7"
      "$shiftMod, 8, movetoworkspace, 8"
      "$shiftMod, 9, movetoworkspace, 9"
	    "$shiftMod, 0, movetoworkspace, 10"

	    # send active window to workspace w/ mod + alt + [0-9]
	    "$altMod, 1, movetoworkspacesilent, 1"
      "$altMod, 2, movetoworkspacesilent, 2"
      "$altMod, 3, movetoworkspacesilent, 3"
      "$altMod, 4, movetoworkspacesilent, 4"
      "$altMod, 5, movetoworkspacesilent, 5"
      "$altMod, 6, movetoworkspacesilent, 6"
      "$altMod, 7, movetoworkspacesilent, 7"
      "$altMod, 8, movetoworkspacesilent, 8"
      "$altMod, 9, movetoworkspacesilent, 9"
	    "$altMod, 0, movetoworkspacesilent, 10"

	    # scroll through existing workspaces w/ mod + mwheel
	    "$mainMod, mouse_down, workspace, e+1"
	    "$mainMod, mouse_up, workspace, e-1"

	    # start apps
	    "$mainMod, E, exec, dolphin"
	    "$mainMod, Q, exec, alacritty"
	    "$mainMod, R, exec, fuzzel -f HackNerdFontMono:size=14 -T alacritty -w 48 -b 1e1e2eff -t cdd6f4ff -m b4befeff -s 313244ff -B 2 -r 2 -C b4befeff -l 7 --icon-theme=Papirus-Dark $@ <&0"
	    "$shiftMod, Q, exec, firefox"
	    "$shiftMod, D, exec, discord"
	    "$shiftMod, K, exec, keepassxc"

	    # volume controls via pamixer
	    ", XF86AudioMute, exec, pamixer -t"
	    ", XF86AudioLowerVolume, exec, pamixer -d 5"
	    ", XF86AudioRaiseVolume, exec, pamixer -i 5"
	    "SHIFT, XF86AudioMute, exec, pamixer --default-source -t"

	    # playback controls via playerctl
	    ", XF86AudioNext, exec, playerctl next"
	    ", XF86AudioPrev, exec, playerctl previous"
	    ", XF86AudioPlay, exec, playerctl play-pause"

	    # brightness controls via brightnessctl
	    ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
	    ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"

            # lock screen w/ mod + L
            "$mainMod, L, exec, qs ipc call globalIPC toggleLock"
    ];

    # mouse binds
    bindm = [
      # move/resize windows w/ mod + lmb/rmb + dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
