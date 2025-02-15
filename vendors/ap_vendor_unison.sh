alias apinitunison="ap_func_init_unison"
ap_func_init_unison() {
    export AP_XXX_CONF_DIR="${HOME}/.config/unison"

    alias zunison="cd /Applications/unison.app/Contents/MacOS"
    alias zunison="cd \${HOME}/.unison"
    alias zunison="cd \${HOME}/.config/unison"

    if alias apinitunisonshare &>/dev/null; then
        apinitunisonshare
    fi

    if alias apinitunisoncommon &>/dev/null; then
        apinitunisoncommon
    fi

    if alias apinitunisonmain &>/dev/null; then
        apinitunisonmain
    fi
}

alias apcreatedirstructunison="ap_func_create_dirstruct_unison"
ap_func_create_dirstruct_unison() {
    apshowmsginfo "Generate [unison] bash autocomplete\n"
    unison >"${AP_COMPLETIONS_DIR}/ap_completion_unison.bash"

    if [ -f "${HOME}/scripto-share/vendors/unison/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/unison/bindings.json] to [${HOME}/scripto-share/vendors/unison/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/unison/bindings.json" "${HOME}/.config/unison/bindings.json"
    fi

    if [ -f "${AP_SOFT_DIR}/unison/unison" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/unison] to [${AP_SOFT_DIR}/unison/bin/unison]\n"
        ln -sf "${AP_SOFT_DIR}/unison/bin/unison" "${AP_SOFT_DIR}/bin/unison"
    fi

    if [ -f "${AP_SOFT_DIR}/unison/unison" ]; then
        apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_unison.bash] to [${AP_SOFT_DIR}/unison/complete/unison.bash]\n"
        ln -sf "${AP_SOFT_DIR}/unison/complete/unison.bash" "${AP_COMPLETIONS_DIR}/ap_completion_unison.bash"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/unison.1] to [${AP_SOFT_DIR}/unison/unison.1]\n"
    ln -sf "${AP_SOFT_DIR}/unison/unison.1" "${AP_MAN_DIR}/man1/unison.1"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/unison/config.mac.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/unison"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.base.env" "${XDG_CONFIG_HOME}/unison/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.key.mac.env" "${XDG_CONFIG_HOME}/unison/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.mac.env" "${XDG_CONFIG_HOME}/unison/config"
            else
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.unison"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.unison/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.unison/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.unison/config"
            fi
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/unison/config.linux.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/unison"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.base.env" "${XDG_CONFIG_HOME}/unison/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.key.linux.env" "${XDG_CONFIG_HOME}/unison/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.linux.env" "${XDG_CONFIG_HOME}/unison/config"
            else
                mkdir -p "${HOME}/.config/unison"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.base.env" "${HOME}/.config/unison/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.key.linux.env" "${HOME}/.config/unison/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/unison/config.linux.env" "${HOME}/.config/unison/config"
            fi
        fi
    fi

    if alias apcreatedirstructunisonshare &>/dev/null; then
        apcreatedirstructunisonshare
    fi

    if alias apcreatedirstructunisoncommon &>/dev/null; then
        apcreatedirstructunisoncommon
    fi

    if alias apcreatedirstructunisonmain &>/dev/null; then
        apcreatedirstructunisonmain
    fi
}

alias aprmdirstructunison="ap_func_rm_dirstruct_unison"
ap_func_rm_dirstruct_unison() {
    apshowmsginfo "Remove [${HOME}/.config/unison/]\n"
    rm -f "${HOME}/.config/unison/"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/unison]\n"
    rm -f "${AP_SOFT_DIR}/bin/unison"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_unison.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_unison.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/unison.1]\n"
    rm -f "${AP_MAN_DIR}/man1/unison.1"

    if alias aprmdirstructunisonshare &>/dev/null; then
        aprmdirstructunisonshare
    fi

    if alias aprmdirstructunisoncommon &>/dev/null; then
        aprmdirstructunisoncommon
    fi

    if alias aprmdirstructunisonmain &>/dev/null; then
        aprmdirstructunisonmain
    fi
}

alias apcreateglobalsymlinkunison="ap_func_create_global_symlink_unison"
ap_func_create_global_symlink_unison() {
    if [ -f "${AP_SOFT_DIR}/bin/unison" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/unison] to [${AP_SOFT_DIR}/bin/unison]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/unison" "/usr/local/bin/unison"
    fi
}

alias aprmglobalsymlinkunison="ap_func_rm_global_symlink_unison"
ap_func_rm_global_symlink_unison() {
    if [ -f "/usr/local/bin/unison" ]; then
        apshowmsginfo "Remove [/usr/local/bin/unison]\n"
        sudo rm -f "/usr/local/bin/unison"
    fi
}

alias apsetupunison="ap_func_setup_unison"
ap_func_setup_unison() {
    apshowmsginfo "Install [unison]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install unison
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y unison
    fi

    apinitunison
    if alias apcreatedirstructunison &>/dev/null; then
        apcreatedirstructunison
    fi
}

alias aprmunison="ap_func_rm_unison"
ap_func_rm_unison() {
    apshowmsginfo "Remove [unison]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove unison
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y unison
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructunison &>/dev/null; then
        aprmdirstructunison
    fi

    if alias aprmglobalsymlinkunison &>/dev/null; then
        aprmglobalsymlinkunison
    fi
}
