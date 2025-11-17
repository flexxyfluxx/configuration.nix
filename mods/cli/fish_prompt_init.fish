set fish_color_status       red
set fish_color_cwd          cyan
set fish_color_user         green
set fish_color_user_root    red
set fish_color_at_sign      brblue
set fish_color_host         blue
set fish_color_host_remote  yellow
set fish_color_git          red

set fish_prompt_pwd_full_dirs   8

function prompt_user --description 'display user name for the prompt'
    # Prepend the chroot environment if present
    if set -q __fish_machine[1]
        echo -n -s (set_color yellow) "$__fish_machine" (set_color normal) ' '
    end

    set -l color_host $fish_color_host

    # If we're running via SSH, change the host color.
    if set -q SSH_TTY; and set -q fish_color_host_remote
        set color_host $fish_color_host_remote
    end

    echo -n -s (set_color $fish_color_user) "$USER" (set_color $fish_color_at_sign) @ (set_color $color_host) (prompt_hostname) (set_color normal)
end

function git_branch_name
    set -l branch (git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if test "$branch" != ""
        echo -ns (set_color normal) ' on ' (set_color $fish_color_git)$branch
    end
end

# based on the default fish prompt, and tailored to my needs/prefs
function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l normal (set_color normal)
    set -l color_cwd $fish_color_cwd
    
    set -l suffix '>'

    # Color the prompt differently when we're root
    if functions -q fish_is_root_user; and fish_is_root_user
        set color_user $fish_color_user_root
        set suffix '#'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "error " "" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -n $prompt_status
    if test "$prompt_status" != ""
        echo
    end
    echo -ns (prompt_user)' ' (set_color $color_cwd) (prompt_pwd) $normal (git_branch_name) $normal \n " ~" $suffix " "
end
