# set vi mode because i use vim btw
#set -o vi

### status codes
precmd() {
  err=$?

    # this shit happens so we dont get a status code after neofetch
    # which is bad because we havent entered a single command yet. fuck we want a prompt for
    #
    # ..more importantly, no status code after cle, cll, etc
    if [[ ! -v preflag ]]; then
        preflag=0
    elif [[ preflag -eq 0 ]]; then
        preflag=1
    fi
    
    if [[ $preflag -ne 0 ]]; then
        if [[ $err == 0 ]]; then
            print -rP "%F{green}exit code 0"
        else
            print -rP "%F{red}exit code $err"
        fi
    fi
}

# minimally streamline screen sharing (deprecated, but i'll keep it here as a historical artefact or whatever)
# alias setup_screenshare='mpv --gpu-context=waylandvk udp://0.0.0.0:1111 --no-cache --untimed --no-demuxer-thread --video-sync=audio --vd-lavc-threads=1 & wf-recorder --muxer=mpegts --codec=libx264 --file=udp://0.0.0.0:1111'


### aliases and vars
# export GIT=/mnt/sharedssd/GIT
# export USB=/mnt/usb
# export WIN=/mnt/winssd
# export SHSSD=/mnt/sharedssd
# export SHHDD=/mnt/sharedhdd

# alias ls='ls --color=auto -F '
# alias le='exa --icons '
# alias la='le -a '
# alias ll='la -l --header --git '
# alias lt='la -T'
# alias llt='ll -T'
# alias lsd="le /dev "
# alias cd.='cd ..'
# alias goodnight='shutdown 0'
# alias grep='grep --color=auto'
# alias smolfetch='neofetch --config ~/.config/neofetch/smolfetch.conf --ascii_bold on'
# alias nv='nvim '
# alias woman=man

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
