alias apinitx="ap_func_init_x"
ap_func_init_x() {
    export AP_X_DIR="${HOME}/.x-cmd.root"
    alias zx="cd ${AP_X_DIR}"

    source "${AP_X_DIR}/X"

    if alias apinitxshare &>/dev/null; then
        apinitxshare
    fi

    if alias apinitxcommon &>/dev/null; then
        apinitxcommon
    fi

    if alias apinitxmain &>/dev/null; then
        apinitxmain
    fi
}

alias apcreatedirstructx="ap_func_create_dirstruct_x"
ap_func_create_dirstruct_x() {
    if alias apcreatedirstructxshare &>/dev/null; then
        apcreatedirstructxshare
    fi

    if alias apcreatedirstructxcommon &>/dev/null; then
        apcreatedirstructxcommon
    fi

    if alias apcreatedirstructxmain &>/dev/null; then
        apcreatedirstructxmain
    fi
}

alias aprmdirstructx="ap_func_rm_dirstruct_x"
ap_func_rm_dirstruct_x() {
    if alias aprmdirstructxshare &>/dev/null; then
        aprmdirstructxshare
    fi

    if alias aprmdirstructxcommon &>/dev/null; then
        aprmdirstructxcommon
    fi

    if alias aprmdirstructxmain &>/dev/null; then
        aprmdirstructxmain
    fi
}

# alias apcreateglobalsymlinkx="ap_func_create_global_symlink_x"
# ap_func_create_global_symlink_x() {
#     if [ -f "${AP_X_DIR}/bin/x" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/x] to [${AP_X_DIR}/bin/x]\n"
#         sudo ln -sf "${AP_X_DIR}/bin/x" "/usr/local/bin/x"
#     fi
# }

# alias aprmglobalsymlinkx="ap_func_rm_global_symlink_x"
# ap_func_rm_global_symlink_x() {
#     if [ -f "/usr/local/bin/x" ]; then
#         aplogshow "Remove [/usr/local/bin/x]\n"
#         sudo rm -f "/usr/local/bin/x"
#     fi
# }

alias apsetupx="ap_func_setup_x"
ap_func_setup_x() {
    aplogshow "Install [x]\n"
    eval "$(curl https://get.x-cmd.com)"

    apinitx
    # apcreateglobalsymlinkx

    if alias apcreatedirstructx &>/dev/null; then
        apcreatedirstructx
    fi
}

alias aprmx="ap_func_rm_x"
ap_func_rm_x() {
    aplogshow "Remove [x]\n"

    x boot clear
    rm -rf "${AP_X_DIR}"

    if alias aprmdirstructx &>/dev/null; then
        aprmdirstructx
    fi

    if alias aprmglobalsymlinkx &>/dev/null; then
        aprmglobalsymlinkx
    fi
}
