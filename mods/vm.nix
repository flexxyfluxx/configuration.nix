{ lib, config, pkgs, ... }:
let
    cfg = config.mods.vm;
in {
    options.mods.vm = {
        enable = lib.mkEnableOption "enable kernel opts to allow gpu passthrough to vm";
        vfio-pci-ids = lib.mkOption  {
            description = "VFIO pci ids of devices to be passed through to vm";
            default = [];
            type = lib.types.listOf lib.types.str;
        };
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

        boot = {
            extraModprobeConfig = ''
                options kvm_amd nested=1
                options kvm ignore_msrs=1Control report_ignored_msrs=0
            '';
            kernelModules = [
                # "kvmfr"
                "vfio"
                "vfio_iommu_type1"
                "vfio_pci"
                "vfio_virqfd"
                "amdgpu"
            ];
            kernelParams = [
                "psi=1"
                ("vfio-pci.ids=" + lib.concatStringsSep "," cfg.vfio-pci-ids)
            ];
        };
    };
}
