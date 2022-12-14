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

function pixiv-dl
    gallery-dl -D ~/Pictures/Wallpapers/ https://www.pixiv.net/en/users/45725525/bookmarks/artworks/wallpaper
end

function vmware
    GTK_THEME=Orchis vmware-view $argv
end

function tra
    trash-put $argv
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
