alias apinitglim="ap_func_init_glim"
ap_func_init_glim() {
    if alias apinitglimshare &>/dev/null; then
        apinitglimshare
    fi

    if alias apinitglimcommon &>/dev/null; then
        apinitglimcommon
    fi

    if alias apinitglimmain &>/dev/null; then
        apinitglimmain
    fi
}

alias apcreatedirstructglim="ap_func_create_dirstruct_glim"
ap_func_create_dirstruct_glim() {
    if alias apcreatedirstructglimshare &>/dev/null; then
        apcreatedirstructglimshare
    fi

    if alias apcreatedirstructglimcommon &>/dev/null; then
        apcreatedirstructglimcommon
    fi

    if alias apcreatedirstructglimmain &>/dev/null; then
        apcreatedirstructglimmain
    fi
}

alias aprmdirstructglim="ap_func_rm_dirstruct_glim"
ap_func_rm_dirstruct_glim() {
    if alias aprmdirstructglimshare &>/dev/null; then
        aprmdirstructglimshare
    fi

    if alias aprmdirstructglimcommon &>/dev/null; then
        aprmdirstructglimcommon
    fi

    if alias aprmdirstructglimmain &>/dev/null; then
        aprmdirstructglimmain
    fi
}

# alias apcreateglobalsymlinkglim="ap_func_create_global_symlink_glim"
# ap_func_create_global_symlink_glim() {
#     if [ -f "${AP_SOFT_DIR}/bin/glim" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/glim] to [${AP_SOFT_DIR}/bin/glim]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/glim" "/usr/local/bin/glim"
#     fi
# }

# alias aprmglobalsymlinkglim="ap_func_rm_global_symlink_glim"
# ap_func_rm_global_symlink_glim() {
#     if [ -f "/usr/local/bin/glim" ]; then
#         aplogshow "Remove [/usr/local/bin/glim]\n"
#         sudo rm -f "/usr/local/bin/glim"
#     fi
# }

alias apsetupglim="ap_func_setup_glim"
ap_func_setup_glim() {
    # https://github.com/junkdog/glim
    aplogshow "Install [glim]\n"
    cargo install glim

    apinitglim
    if alias apcreatedirstructglim &>/dev/null; then
        apcreatedirstructglim
    fi
}

alias aprmglim="ap_func_rm_glim"
ap_func_rm_glim() {
    aplogshow "Remove [glim]\n"
    cargo uninstall glim

    if alias aprmdirstructglim &>/dev/null; then
        aprmdirstructglim
    fi

    if alias aprmglobalsymlinkglim &>/dev/null; then
        aprmglobalsymlinkglim
    fi
}
