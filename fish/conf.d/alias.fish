# Most used
abbr --add n nvim
abbr --add l lfcd
abbr --add t trash-put
abbr --add c clear
abbr --add m make

# Git
abbr --add -- gs git status
abbr --add -- ga git add
abbr --add -- gc git commit -m
abbr --add -- gca git commit -a -m
abbr --add -- gpl git pull
abbr --add -- gps git push
abbr --add -- gpf git push --force
abbr --add -- glb git log --graph --oneline --decorate
abbr --add -- gl git log --graph --oneline --decorate --all
abbr --add -- gk git checkout
abbr --add -- gb git checkout -b
abbr --add -- gcl git clone
abbr --add -- gmv git mv
abbr --add -- grt git restore
abbr --add -- gr git rebase
abbr --add -- gd git diff
abbr --add -- gsh git stash

# Fish shell for root user when switching with su
function su
   command su --shell=/usr/bin/fish $argv
end

function config_tide
    tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=No
end

function rm
    command rm -I $argv
end

function ip
    command ip -color=auto $argv
end

function rickroll
    curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash
end

function pico8
    ~/.local/share/pico8/pico8
end

function vmware
    GTK_THEME=Orchis vmware-view $argv
end

function icat
    kitty +kitten icat $argv
end

function emoji
    kitty +kitten unicode_input --emoji-variation graphic
end

function osu
    swaymsg seat "*" hide_cursor when-typing toggle
    swaymsg output eDP-1 toggle
end 

function ssh
    TERM=xterm-color command ssh $argv
end

function weather
    curl wttr.in
end
