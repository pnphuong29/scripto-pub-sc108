# https://github.com/ricardofabila/fox
alias apinitfox="ap_func_init_fox"
ap_func_init_fox() {
    export AP_FOX_DIR="/usr/local/Fox"
    apaddpath "${AP_FOX_DIR}/bin"

    if alias apinitfoxshare &>/dev/null; then
        apinitfoxshare
    fi

    if alias apinitfoxcommon &>/dev/null; then
        apinitfoxcommon
    fi

    if alias apinitfoxmain &>/dev/null; then
        apinitfoxmain
    fi
}

alias apcreatedirstructfox="ap_func_create_dirstruct_fox"
ap_func_create_dirstruct_fox() {
    aplogshow "Generate [fox] bash autocomplete\n"
    fox completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_fox.bash"

    if alias apcreatedirstructfoxshare &>/dev/null; then
        apcreatedirstructfoxshare
    fi

    if alias apcreatedirstructfoxcommon &>/dev/null; then
        apcreatedirstructfoxcommon
    fi

    if alias apcreatedirstructfoxmain &>/dev/null; then
        apcreatedirstructfoxmain
    fi
}

alias aprmdirstructfox="ap_func_rm_dirstruct_fox"
ap_func_rm_dirstruct_fox() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fox.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fox.bash"

    if alias aprmdirstructfoxshare &>/dev/null; then
        aprmdirstructfoxshare
    fi

    if alias aprmdirstructfoxcommon &>/dev/null; then
        aprmdirstructfoxcommon
    fi

    if alias aprmdirstructfoxmain &>/dev/null; then
        aprmdirstructfoxmain
    fi
}

# alias apcreateglobalsymlinkfox="ap_func_create_global_symlink_fox"
# ap_func_create_global_symlink_fox() {
#     if [ -f "${AP_SOFT_DIR}/bin/fox" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/fox] to [${AP_SOFT_DIR}/bin/fox]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/fox" "/usr/local/bin/fox"
#     fi
# }

# alias aprmglobalsymlinkfox="ap_func_rm_global_symlink_fox"
# ap_func_rm_global_symlink_fox() {
#     if [ -f "/usr/local/bin/fox" ]; then
#         aplogshow "Remove [/usr/local/bin/fox]\n"
#         sudo rm -f "/usr/local/bin/fox"
#     fi
# }

alias apsetupfox="ap_func_setup_fox"
ap_func_setup_fox() {
    aplogshow "Install [fox]\n"

    sudo curl -fsSL "install.getfox.sh" | bash

    apinitfox
    if alias apcreatedirstructfox &>/dev/null; then
        apcreatedirstructfox
    fi
}

alias aprmfox="ap_func_rm_fox"
ap_func_rm_fox() {
    aplogshow "Remove [fox]\n"

    sudo rm -rf "${AP_FOX_DIR}"

    if alias aprmdirstructfox &>/dev/null; then
        aprmdirstructfox
    fi

    if alias aprmglobalsymlinkfox &>/dev/null; then
        aprmglobalsymlinkfox
    fi
}
