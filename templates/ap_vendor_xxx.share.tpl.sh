alias apinitxxxshare="ap_func_init_xxx_share"
ap_func_init_xxx_share() {
    export AP_XXX_CONF_DIR="${HOME}/.config/xxx"

    alias zxxx="cd /Applications/xxx.app/Contents/MacOS"
    alias zxxx="cd \${HOME}/.xxx"
    alias zxxx="cd \${HOME}/.config/xxx"

    alias viscxxx="vi -p \
	   \${HOME}/scripto/vendors/ap_vendor_xxx.sh \
	   \${HOME}/scripto-share/vendors/ap_vendor_xxx.sh \
	   \${HOME}/.config/xxx/config.toml \
	"
}

alias apcreatedirstructxxxshare="ap_func_create_dirstruct_xxx_share"
ap_func_create_dirstruct_xxx_share() {
    apshowmsginfo "Download and backup original config\n"
    curl -SL "https://raw.githubusercontent.com/pamburus/xxx/refs/heads/master/etc/defaults/config.yaml" >"${HOME}/scripto-share/vendors/xxx/config.origin.yaml"

    if [ -f "${HOME}/scripto-common/vendors/xxx/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/xxx/bindings.json] to [${HOME}/scripto-common/vendors/xxx/bindings.json]\n"
        ln -sf "${HOME}/scripto-common/vendors/xxx/bindings.json" "${HOME}/.config/xxx/bindings.json"
    fi

    if [ -f "${HOME}/scripto-share/vendors/xxx/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/xxx/bindings.json] to [${HOME}/scripto-share/vendors/xxx/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/xxx/bindings.json" "${HOME}/.config/xxx/bindings.json"
    fi

    apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/xxx] to [${AP_SOFT_DIR}/xxx/bin/xxx]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/bin/xxx" "${AP_SOFT_DIR}/bin/xxx"

    apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash] to [${AP_SOFT_DIR}/xxx/complete/xxx.bash]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/autocomplete/xxx.bash" "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/xxx.1] to [${AP_SOFT_DIR}/xxx/xxx.1]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/xxx.1" "${AP_MAN_DIR}/man1/xxx.1"
}

alias aprmdirstructxxxshare="ap_func_rm_dirstruct_xxx_share"
ap_func_rm_dirstruct_xxx_share() {
    apshowmsginfo "Remove [${HOME}/.config/xxx/bindings.json]\n"
    rm -f "${HOME}/.config/xxx/bindings.json"

    apshowmsginfo "Remove [${HOME}/.config/xxx/]\n"
    rm -rf "${HOME}/.config/xxx/"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/xxx]\n"
    rm -f "${AP_SOFT_DIR}/bin/xxx"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/xxx.1]\n"
    rm -f "${AP_MAN_DIR}/man1/xxx.1"
}
