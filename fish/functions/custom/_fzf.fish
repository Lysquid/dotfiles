function _fzf -d "Find files to add to the command line"

    function append_to_command
        while read -l f
            commandline -i -- (string escape $f)
            commandline -i " " 
        end
    end

    eval fzf -m | append_to_command
end