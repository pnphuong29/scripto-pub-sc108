alias apinitsuperfile="ap_func_init_superfile"
ap_func_init_superfile() {
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        export AP_SPF_CONF_DIR="${HOME}/Library/Application Support/superfile"
        alias zspfdata='cd "${HOME}/Library/Application Support/superfile"'
        alias zspfconfigs='cd "${HOME}/Library/Application Support/superfile"'
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        export AP_SPF_CONF_DIR="${HOME}/.config/superfile"
        alias zspfdata='cd "${HOME}/.config/superfile"'
        alias zspfconfigs='cd "${HOME}/.config/superfile"'
    fi

    if alias apinitsuperfileshare &>/dev/null; then
        apinitsuperfileshare
    fi

    if alias apinitsuperfilecommon &>/dev/null; then
        apinitsuperfilecommon
    fi

    if alias apinitsuperfilemain &>/dev/null; then
        apinitsuperfilemain
    fi
}

alias apcreatedirstructsuperfile="ap_func_create_dirstruct_superfile"
ap_func_create_dirstruct_superfile() {
    if alias apcreatedirstructsuperfileshare &>/dev/null; then
        apcreatedirstructsuperfileshare
    fi

    if alias apcreatedirstructsuperfilecommon &>/dev/null; then
        apcreatedirstructsuperfilecommon
    fi

    if alias apcreatedirstructsuperfilemain &>/dev/null; then
        apcreatedirstructsuperfilemain
    fi
}

alias aprmdirstructsuperfile="ap_func_rm_dirstruct_superfile"
ap_func_rm_dirstruct_superfile() {
    if alias aprmdirstructsuperfileshare &>/dev/null; then
        aprmdirstructsuperfileshare
    fi

    if alias aprmdirstructsuperfilecommon &>/dev/null; then
        aprmdirstructsuperfilecommon
    fi

    if alias aprmdirstructsuperfilemain &>/dev/null; then
        aprmdirstructsuperfilemain
    fi
}

# alias apcreateglobalsymlinksuperfile="ap_func_create_global_symlink_superfile"
# ap_func_create_global_symlink_superfile() {
#     if [ -f "${AP_SOFT_DIR}/bin/superfile" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/superfile] to [${AP_SOFT_DIR}/bin/superfile]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/superfile" "/usr/local/bin/superfile"
#     fi
# }

# alias aprmglobalsymlinksuperfile="ap_func_rm_global_symlink_superfile"
# ap_func_rm_global_symlink_superfile() {
#     if [ -f "/usr/local/bin/superfile" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/superfile]\n"
#         sudo rm -f "/usr/local/bin/superfile"
#     fi
# }

alias apsetupsuperfile="ap_func_setup_superfile"
ap_func_setup_superfile() {
    apshowmsginfo "Install [superfile]\n"

    bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"
    apinitsuperfile
    apshowmsginfo "You should run spf 1st time to initialize the configuration directory\n"

    if alias apcreatedirstructsuperfile &>/dev/null; then
        apcreatedirstructsuperfile
    fi
}

alias aprmsuperfile="ap_func_rm_superfile"
ap_func_rm_superfile() {
    apshowmsginfo "Remove [superfile]\n"

    rm -f "/usr/local/bin/superfile"
    rm -rf "${AP_SPF_CONF_DIR}"

    if alias aprmdirstructsuperfile &>/dev/null; then
        aprmdirstructsuperfile
    fi

    if alias aprmglobalsymlinksuperfile &>/dev/null; then
        aprmglobalsymlinksuperfile
    fi
}
