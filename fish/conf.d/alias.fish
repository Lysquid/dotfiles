function rm 
    command rm -I
end

function ip
    command ip -color=auto
end

function rickroll
    'curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
end

function reload
    source .config/fish/**.fish
end

function pico8
    ~/.local/share/pico8/pico8
end

function vmware
    GTK_THEME=Orchis vmware-view
end

function tra
    trash-put
end