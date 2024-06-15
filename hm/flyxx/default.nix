{ lib, config, ... }:
{
    options.hm = {
        users.flyxx.enable = lib.mkEnableOption "enable HM config of user flyxx";
    };
    config = lib.mkIf config.hm.users.flyxx.enable {
        home-manager.users."flyxx" = {
            imports = [
                ./desktopApps
                ./sway
                ./waybar
                ./swaylock
                ./mail.nix
                ./home.nix
            ];
        };
    };
}
