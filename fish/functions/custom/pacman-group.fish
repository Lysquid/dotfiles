if type -q pacman

    function pacman-group -a "group" -d "Describe the packages of a group with installed status"

        set -l all_packages (pacman -Sg $argv[1] | awk '{print $2}' | sort)
        set -l installed_packages (pacman -Qg $argv[1] 2>/dev/null | awk '{print $2}' | sort)

        if test -z "$all_packages"
            echo "no group $argv[1]"
            return 1
        end

        pacman -Si $all_packages | awk -v installed_packages="$installed_packages" '
            /^Name/ {
                name=$3
                if (installed_packages ~ " " name " ") {
                    printf "\033[32m%s\033[0m: ", name
                } else {
                    printf "\033[31m%s\033[0m: ", name
                }
            }
            /^Description/ {
                desc=$0
                sub(/^Description *: /, "", desc)
                print desc
            }'
    end

end