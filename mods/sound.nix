{ lib, config, ... }:
let
    cfg = config.mods.sound;
in {
    options.mods = {
        sound = {
            enable = lib.mkEnableOption "enable sound" // { default = true; };
            alsa.enable = lib.mkEnableOption "enable alsa" // { default = true; };
        };
    };
    config = lib.mkIf cfg.enable {
        # INFO: not meant to be used with pipewire, that has its own alsa compat
        # sound.enable = true;

        # hardware.pulseaudio.enable = true;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = cfg.alsa.enable;
            alsa.support32Bit = cfg.alsa.enable; 
            pulse.enable = true;
        };
    };
}
