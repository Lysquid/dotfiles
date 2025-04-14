set fish_greeting

set fish_function_path $fish_function_path ~/.config/fish/functions/custom

if type -q fisher
    set sponge_delay 10
end

if type -q navi
    navi widget fish | source
end

if type -q zoxide
    zoxide init fish | source
end