{ cpu-count, mkCpuIconString }:
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
        format = "{:%a %d %T}";
        tooltip = true;
        tooltip-format = "{:%a %Y-%m-%d %T %Z %z}";
    };
    cpu = {
        interval = 1;
        format = "CPU ${mkCpuIconString cpu-count} "
               + "FREQ ~{avg_frequency:0<4} ↑{max_frequency:0<4} ↓{min_frequency:0<4}";
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
        interval = 10;
        # format = "{used:0.1f}/{total:0.1f} on {path}";
        # unit = "GiB";
    };
    memory = {
        interval = 1;
        format = "MEM {used:0.1f}/{total:0.1f}";
        tooltip-format = "main: {used:0.1f}/{total:0.1f}; swap: {swapUsed:0.1f}/{swapTotal:0.1f}";
    };
    network = {
        interval = 1;
    };
}
