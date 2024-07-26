# Short abbreviations
if type -q nvim;            abbr --add n        nvim;               end
if type -q lfcd;            abbr --add l        lfcd;               end
if type -q trash-put;       abbr --add t        trash-put;          end
if type -q trash-restore;   abbr --add tr       trash-restore;      end
if type -q make;            abbr --add m        make;               end
if type -q zi;              abbr --add zi --    zoxide query -i;    end
if type -q lsd;             abbr --add ll --    lsd -al;            end

# Alternatives
if type -q z;               abbr --add cd       z;                  end
if type -q lsd;             abbr --add ls       lsd;                end
if type -q rg;              abbr --add grep     rg;                 end
if type -q bat;             abbr --add cat      bat;                end
if type -q batman;          abbr --add man      batman;             end
if type -q delta;           abbr --add diff     delta;              end
if type -q fd;              abbr --add find     fd;                 end
if type -q nvim;            abbr --add vim      nvim;               end

# Git
abbr --add -- gs    git status
abbr --add -- ga    git add
abbr --add -- gc    git commit -m
abbr --add -- gca   git commit -a -m
abbr --add -- gpl   git pull
abbr --add -- gps   git push
abbr --add -- gpf   git push --force
abbr --add -- glb   git log --graph --oneline --decorate
abbr --add -- gl    git log --graph --oneline --decorate --all
abbr --add -- gk    git checkout
abbr --add -- gb    git checkout -b
abbr --add -- gcl   git clone
abbr --add -- gmv   git mv
abbr --add -- grt   git restore
abbr --add -- gr    git rebase
abbr --add -- gd    git diff
abbr --add -- gsh   git stash

# Fish shell for root user when switching with su
function su
   command su --shell=/usr/bin/fish $argv
end

function rm
    command rm -I $argv
end

function ip
    command ip -color=auto $argv
end

if type -q tide
    function config_tide
        tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=No
    end
end

if type -q gallery-dl
    function pixiv-dl
        gallery-dl -D ~/Pictures/Wallpapers/PC/ https://www.pixiv.net/en/users/45725525/bookmarks/artworks/wallpaper
    end
end

if type -q osu-lazer
    function osu
        swaymsg seat "*" hide_cursor when-typing toggle
        swaymsg output eDP-1 toggle
    end 
end

# Really needed, as it otherwise breaks foot
if test $TERM != "xterm-color"
    function ssh
        TERM=xterm-color command ssh $argv
    end
end

