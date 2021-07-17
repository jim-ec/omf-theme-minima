function one_pwd
    echo $PWD | sed 's:/Users/'$USER':~:'
end

function relpath
    set -l pos $argv[1]
    set -l ref $argv[2]
    set -l down ''

    # case "$ref" in $pos/*) break;; esac

    while true
        if [ $pos = '/' ]
            break
        end
    end
end

function path_to_array
    echo $argv[1] | sed 's:/:\n:g'
end

function shortened_path
    set long (path_to_array $PWD)
    set short (path_to_array $argv[1])
    set start (count $short)
    set end (count $long)
    for i in (seq $start $end)
        echo -n $long[$i]
        if [ $i -lt $end ]
            echo -n '/'
        end
    end
end

function pwd
    set repos_root (git rev-parse --show-toplevel 2> /dev/null)
    if [ $status = 0 ]
        set dir (shortened_path $repos_root)
    else
        set dir $PWD
    end
    echo $dir | sed -E 's:^/Users/'$USER':~:'
end

function git_status_icon
    if echo $argv[1] | grep -q -e $argv[3]
        set_color $argv[2]
        echo -n ' '$argv[3]
        set_color white
    end
end

function git_status_icons
    set -l git_status (echo (git status --porcelain 2> /dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n'))

    git_status_icon $git_status red 'D' # Deleted
    git_status_icon $git_status yellow 'R' # Renamed
    git_status_icon $git_status yellow 'C' # Copied
    git_status_icon $git_status green 'A' # Added
    git_status_icon $git_status blue 'U' # Updated but unmerged
    git_status_icon $git_status yellow 'M' # Modified
    git_status_icon $git_status yellow '?' # Untracked
end

function fish_prompt
    set -g last_status $status

    tput bold

    if test $last_status -ne 0
        set_color red
    else
        set_color green
    end
    if test (id -u $USER) -eq 0
        echo -n '# '
    else
        echo -n '❯ '
    end
    set_color white

    echo -n (pwd)

    tput sgr0
    echo -n '  '
end
