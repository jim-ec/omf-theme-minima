function minima_path_to_array
    echo $argv[1] | sed 's:/:\n:g'
end

function minima_shortened_path
    set long (minima_path_to_array $PWD)
    set short (minima_path_to_array $argv[1])
    set start (count $short)
    set end (count $long)
    for i in (seq $start $end)
        echo -n $long[$i]
        if [ $i -lt $end ]
            echo -n '/'
        end
    end
end

function minima_pwd
    set repos_root (git rev-parse --show-toplevel 2> /dev/null)
    if [ $status = 0 ]
        set dir (minima_shortened_path $repos_root)
    else
        set dir $PWD
    end
    echo $dir | sed -E 's:^/Users/'$USER':~:'
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

    echo -n (minima_pwd)

    tput sgr0
    echo -n '  '
end
