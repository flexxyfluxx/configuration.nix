function git_branch_name() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo '%F{white}on %F{red}'$branch''
    fi
}

setopt prompt_subst

autoload -U colors && colors

precmd() {
    err=$?

    # this shit happens so we dont get a status code after neofetch
    # which is bad because we havent entered a single command yet. fuck we want a prompt for
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

PROMPT='%B%(!.%F{red}.%F{green})%n%F{12}@%F{blue}%m%k %B%F{cyan}%~ $(git_branch_name)%F{white}'$'\n'' ╙─%\$%(!.#.$) %b%f%k'

#neofetch --config ~/.config/neofetch/smolfetch.conf --ascii_bold on
