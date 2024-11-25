{
    user,
    ...
}:

{
    programs.fastfetch.settings = {
        display = {
            key.width = 4;
            separator = "";
            size.binaryPrefix = "si";
        };

        logo = {
            preserveAspectRatio = true;
            source = "${user.assets}/nixos-logo.png";
            type = "kitty";
            height = 16;
            padding.left = 1;
        };

        modules = [
              #"break"
              "break"

              {
                key = " ";
                type = "os";
                keyColor = "blue";
                format = "{3}";
              }

              {
                key = "󰌽 ";
                type = "kernel";
                keyColor = "yellow";
              }

              {
                key = "󰅐 ";
                type = "uptime";
                keyColor = "green";
              }

              {
                key = " ";
                type = "packages";
                keyColor = "red";
              }

              {
                key = " ";
                type = "memory";
              }

              {
                key = " ";
                type = "shell";
                keyColor = "magenta";
              }

              {
                key = "󰍹 ";
                type = "display";
                keyColor = "cyan";
              }

              {
                key = " ";
                type = "de";
                keyColor = "blue";
              }

              {
                key = " ";
                type = "wm";
                keyColor = "cyan";
              }

#              {
#                key = "󰌑 ";
#                type = "font";
#                keyColor = "magenta";
#              }

              {
                key = "󰻠 ";
                type = "cpu";
                keyColor = "yellow";
              }

              {
                key = "󰢮 ";
                type = "gpu";
                keyColor = "red";
              }

              {
                key = "󰋊 ";
                type = "disk";
                keyColor = "green";
              }

              {
                key = " ";
                type = "colors";
                keyColor = "magenta";
                symbol = "circle";
              }
        ];
    };
}
