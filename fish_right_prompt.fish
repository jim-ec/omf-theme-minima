set -g one_branch ''

function fish_right_prompt
    set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ -n $branch_name ]
        #if [ $branch_name != $one_branch ]
            set_color yellow
            echo -n $branch_name
            set_color white
            set -g one_branch $branch_name
        #end
    end
    set_color white
end
