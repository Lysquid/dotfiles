# Most used
abbr --add n nvim
abbr --add l lfcd
abbr --add t trash-put
abbr --add c clear
abbr --add m make

# Alternatives
abbr --add cat bat
abbr --add find fd
abbr --add grep rg

# Git
abbr --add -- gs git status
abbr --add -- ga git add
abbr --add -- gc git commit -m
abbr --add -- gca git commit -a -m
abbr --add -- gpl git pull
abbr --add -- gps git push
abbr --add -- gl git log --graph --oneline --decorate
abbr --add -- gck git git checkout
abbr --add -- gb git branch
abbr --add -- gcl git clone
abbr --add -- gmv git mv
abbr --add -- gr git remote

function rm 
    command rm -I $argv
end

function ip
    command ip -color=auto $argv
end

function rickroll
    curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash
end

function reload
    source .config/fish/**.fish
end

function pico8
    ~/.local/share/pico8/pico8
end

function vmware
    GTK_THEME=Orchis vmware-view $argv
end

function i3
    exec startx /bin/i3 > /dev/null 2> /dev/null $argv
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
