set -g fish_greeting

set -g fish_function_path $fish_function_path ~/.config/fish/functions/custom

set -g sponge_delay 10

navi widget fish | source

zoxide init fish | source
