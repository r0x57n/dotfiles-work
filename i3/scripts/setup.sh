#!/usr/bin/bash

base="$HOME/.config/i3"
main="$base/main.conf"
parsed="$base/.parsed.conf"
desktop="$base/setups/desktop.conf"
work="$base/setups/work.conf"
laptop="$base/setups/laptop.conf"
final_config="$base/config"

main() {
    case $1 in
        "startup")
            ~/.screenlayout/auto.sh
            make_config
            ;;
        "config")
            make_config
            i3-msg -t run_command mode default
            ;;
        "keys")
            ~/.bin/keys.sh
            i3-msg -t run_command mode default
            ;;
        *)
            echo "$PWD/setup.sh:main() bad input!"
            ;;
    esac
}

make_config() {
    $base/scripts/i3bang
    case $LOCATION in
        "desktop")
            cat $parsed \
                $desktop > $final_config
            ;;
        "laptop")
            cat $parsed \
                $laptop > $final_config
            ;;
        "work")
            cat $parsed \
                $work > $final_config
            ;;
        *)
            echo "$PWD/setup.sh:make_config() bad input!"
            ;;
    esac

}

main "$@"
