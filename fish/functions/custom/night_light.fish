# Night light using gammastep

function night_light
    if pgrep -x gammastep > /dev/null
        pkill gammastep
    else
        gammastep -b 1.0:0.9 -l 45.78:4.87
    end
end
