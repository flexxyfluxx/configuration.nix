# set vi mode because i use vim btw
#set -o vi

# minimally streamline screen sharing (deprecated, but i'll keep it here as a historical artefact or whatever)
# alias setup_screenshare='mpv --gpu-context=waylandvk udp://0.0.0.0:1111 --no-cache --untimed --no-demuxer-thread --video-sync=audio --vd-lavc-threads=1 & wf-recorder --muxer=mpegts --codec=libx264 --file=udp://0.0.0.0:1111'

### some clear extensions
cle() {
    clear
    unset preflag
    le $@
}
cla() {
    clear
    unset preflag
    la $@
}
cll() {
    clear
    unset preflag
    ll $@
}
clt() {
    clear
    unset preflag
    lt $@
}
# csf() {
#     clear
#     unset preflag
#     smolfetch
# }
ccd() {
    clear
    unset preflag
    cd $@
}

### some handy-dandy cd extensions
mkcd() {
    test -d "$1" || mkdir -p "$1" && cd "$1"
}
cdle() {
    cd $@ && le
}
cdla() {
    cd $@ && la
}
cdll() {
    cd $@ && ll
}
cdlt() {
    cd $@ && lt
}

# because this is just horrible and confusing otherwise, why the fuck is this default
unsetopt autocd
