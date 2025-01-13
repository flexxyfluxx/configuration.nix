{ lib, config, pkgs, ... }:
let
    cfg = config.mods.vm;
in {
    options.mods.vm = {
        enable = lib.mkEnableOption "enable kernel opts to allow gpu passthrough to vm";
        cpu = lib.mkOption {
            description = "which cpu vendor, bc apparently that matters";
            default = "amd";
        };
    };
    config = lib.mkIf cfg.enable {
        boot.kernelParams = [
            "${cfg.cpu}_iommu=on"
            # "kvm.ignore_msrs=1"
            # "video=efifb:off"
            # "vfio-pci.ids=1002:73ef,1002:ab28"
        ];
        environment.systemPackages = with pkgs; [
            qemu_kvm
            libvirt
            virt-manager
            iproute2
        ];
    };
}
