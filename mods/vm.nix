{ lib, config, pkgs, ... }:
let
    cfg = config.mods.vm;
in {
    options.mods.vm = {
        enable = lib.mkEnableOption "enable kernel opts to allow gpu passthrough to vm";
    };
    config = lib.mkIf cfg.enable {
        virtualisation.libvirtd = {
            enable = true;
            qemu = {
                package = pkgs.qemu_kvm;
                runAsRoot = true;
                swtpm.enable = true;
                ovmf = {
                    enable = true;
                    packages = [
                        (pkgs.OVMF.override {
                            secureBoot = true;
                            tpmSupport = true;
                        }).fd
                    ];
                };
            };
        };
        programs.virt-manager.enable = true;
        environment.systemPackages = with pkgs; [
            virtiofsd
            libguestfs

            # for macos vm reasons:
            dmg2img
            tesseract
            cdrkit
            nettools
        ];
    };
}
