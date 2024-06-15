{ lib, config, pkgs, ... }:
{
    options.mods = {
        ntfs3g.enable = lib.mkEnableOption ''
            enable FUSE ntfs driver (for when you rlly need posix perms on an ntfs drive :p )
            (srsly, just use kernel driver, it's just better qwq)";
        '';
    };
    config = lib.mkIf config.mods.ntfs3g.enable {
        environment.systemPackages = with pkgs; [
            ntfs3g
        ];
    };
}
