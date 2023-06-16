function invert -d "Invert screen colors"
    if pgrep -x wl-gammactl > /dev/null
        pkill wl-gammactl
    else
        wl-gammactl -c -1 -b 2 &
    end
end
