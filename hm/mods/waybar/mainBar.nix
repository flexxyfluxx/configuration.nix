{
    layer = "top";
    position = "bottom";
    modules-left = [ "sway/workspaces" "sway/mode" ];
    modules-right = [ "network" "load" "temperature" "cpu" "memory" "disk" "battery" "wireplumber" "clock" ];
    modules-center = [ "tray" ];
    wireplumber = {
        scroll-step = 5; # in %
    };
    battery = {
        interval = 1;
        format = "BAT {capacity}% @{power}W {time}";
        format-time = "{H}:{m}";
        states = {
            warning  = 25;
            critical = 10;
        };
    };
    clock = {
        interval = 1;
        format = "{:%Y-%m-%d %T}";
    };
    cpu = {
        interval = 1;
        format = "CPU {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}"
                 "FREQ ~{avg_frequency:0<4} ↑{max_frequency:0<4} ↓{min_frequency:0<4}";
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
    };
    temperature = {
        hwmon-path = "/sys/class/hwmon/hwmon4/temp1_input";
        interval = 1;
        critical-threshold = 60;
        format = "TEMP {temperatureC}°C";
    };
    load = {
        interval = 1;
        format = "LOAD {load1:0<4} {load5:0<4} {load15:0<4}";
        states = {
            test = 0.05;
        };
    };
    disk = {
        interval = 5;
    };
    memory = {
        interval = 1;
    };
    network = {
        interval = 1;
    };
}
