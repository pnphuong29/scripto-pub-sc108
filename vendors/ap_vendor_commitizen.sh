alias apinitcommitizen="ap_func_init_commitizen"
ap_func_init_commitizen() {
    if alias apinitcommitizenshare &>/dev/null; then
        apinitcommitizenshare
    fi

    if alias apinitcommitizencommon &>/dev/null; then
        apinitcommitizencommon
    fi

    if alias apinitcommitizenmain &>/dev/null; then
        apinitcommitizenmain
    fi
}

alias apcreatedirstructcommitizen="ap_func_create_dirstruct_commitizen"
ap_func_create_dirstruct_commitizen() {
    if alias apcreatedirstructcommitizenshare &>/dev/null; then
        apcreatedirstructcommitizenshare
    fi

    if alias apcreatedirstructcommitizencommon &>/dev/null; then
        apcreatedirstructcommitizencommon
    fi

    if alias apcreatedirstructcommitizenmain &>/dev/null; then
        apcreatedirstructcommitizenmain
    fi
}

alias aprmdirstructcommitizen="ap_func_rm_dirstruct_commitizen"
ap_func_rm_dirstruct_commitizen() {
    if alias aprmdirstructcommitizenshare &>/dev/null; then
        aprmdirstructcommitizenshare
    fi

    if alias aprmdirstructcommitizencommon &>/dev/null; then
        aprmdirstructcommitizencommon
    fi

    if alias aprmdirstructcommitizenmain &>/dev/null; then
        aprmdirstructcommitizenmain
    fi
}

# alias apcreateglobalsymlinkcommitizen="ap_func_create_global_symlink_commitizen"
# ap_func_create_global_symlink_commitizen() {
#     if [ -f "${AP_SOFT_DIR}/bin/commitizen" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/commitizen] to [${AP_SOFT_DIR}/bin/commitizen]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/commitizen" "/usr/local/bin/commitizen"
#     fi
# }

# alias aprmglobalsymlinkcommitizen="ap_func_rm_global_symlink_commitizen"
# ap_func_rm_global_symlink_commitizen() {
#     if [ -f "/usr/local/bin/commitizen" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/commitizen]\n"
#         sudo rm -f "/usr/local/bin/commitizen"
#     fi
# }

alias apsetupcommitizen="ap_func_setup_commitizen"
ap_func_setup_commitizen() {
    apshowmsginfo "Install [commitizen]\n"

    pnpm install -g commitizen cz-conventional-changelog
    apinitcommitizen

    if alias apcreatedirstructcommitizen &>/dev/null; then
        apcreatedirstructcommitizen
    fi
}

alias aprmcommitizen="ap_func_rm_commitizen"
ap_func_rm_commitizen() {
    apshowmsginfo "Remove [commitizen]\n"
    pnpm uninstall -g commitizen cz-conventional-changelog

    if alias aprmdirstructcommitizen &>/dev/null; then
        aprmdirstructcommitizen
    fi

    if alias aprmglobalsymlinkcommitizen &>/dev/null; then
        aprmglobalsymlinkcommitizen
    fi
}
