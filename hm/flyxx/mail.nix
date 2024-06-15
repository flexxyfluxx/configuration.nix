{ lib, config, ... }:
{
    options = {
        mods-hm.mail.enable = lib.mkEnableOption "enable mail";
    };
    config = lib.mkIf config.mods-hm.mail.enable {
        accounts.email = {
            accounts = {
                "flyxx @ vonharrach" = {
                    address = "felix@vonharrach.de";

                    imap = {
                        host = "imap.1und1.de";
                        tls.useStartTls = true;
                    };

                    smtp = {
                        host = "smtp.1und1.de";
                        tls.useStartTls = true;
                    };

                    thunderbird = {
                        enable = true;
                        profiles = [ "flyxx" ];
                    };
                    realName = "flyxx";
                    primary = true;
                    userName = "felix@vonharrach.de";
                };
                "flyxx @ outlook" = {
                    address = "felixvonh@outlook.com";

                    imap = {
                        host = "outlook.office365.com";
                        port = 993;
                    };
                    thunderbird = {
                        enable = true;
                        profiles = [ "flyxx" ];
                    };
                    realName = "flyxx";
                    userName = "felixvonh@outlook.com";
                };
                "flyxx @ TU" =  {
                    address = "f.graf.von.harrach@campus.tu-berlin.de";
                    imap = {
                        host = "mail.tu-berlin.de";
                        port = 993;
                    };
                    smtp = {
                        host = "mail.tu-berlin.de";
                        tls.useStartTls = true;
                        port = 587;
                    };

                    thunderbird = {
                        enable = true;
                        profiles = [ "flyxx" ];
                    };
                    realName = "flyxx";
                    userName = "flexxyfluxx@tu-berlin.de";
                };
            };
        };
    };
}
