{ lib, config, ... }:
{
    options.mods = {
        sound.enable = lib.mkEnableOption "enable sound" // {
            default = true;
        };
    };
    config = lib.mkIf config.mods.sound.enable {
        sound.enable = true;
        # hardware.pulseaudio.enable = true;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
    };
}
