alias apinithusky="ap_func_init_husky"
ap_func_init_husky() {
    if alias apinithuskyshare &>/dev/null; then
        apinithuskyshare
    fi

    if alias apinithuskycommon &>/dev/null; then
        apinithuskycommon
    fi

    if alias apinithuskymain &>/dev/null; then
        apinithuskymain
    fi
}

alias apcreatedirstructhusky="ap_func_create_dirstruct_husky"
ap_func_create_dirstruct_husky() {
    if [ -f "${HOME}/scripto-share/vendors/husky/init.sh" ]; then
        aplogshow "Create symlink from [${HOME}/.config/husky/init.sh] to [${HOME}/scripto-share/vendors/husky/init.sh]\n"
        mkdir -p "${HOME}/.config/husky"
        ln -sf "${HOME}/scripto-share/vendors/husky/init.sh" "${HOME}/.config/husky/init.sh"
    fi

    if alias apcreatedirstructhuskyshare &>/dev/null; then
        apcreatedirstructhuskyshare
    fi

    if alias apcreatedirstructhuskycommon &>/dev/null; then
        apcreatedirstructhuskycommon
    fi

    if alias apcreatedirstructhuskymain &>/dev/null; then
        apcreatedirstructhuskymain
    fi
}

alias aprmdirstructhusky="ap_func_rm_dirstruct_husky"
ap_func_rm_dirstruct_husky() {
    aplogshow "Remove [${HOME}/.config/husky]\n"
    rm -f "${HOME}/.config/husky"

    if alias aprmdirstructhuskyshare &>/dev/null; then
        aprmdirstructhuskyshare
    fi

    if alias aprmdirstructhuskycommon &>/dev/null; then
        aprmdirstructhuskycommon
    fi

    if alias aprmdirstructhuskymain &>/dev/null; then
        aprmdirstructhuskymain
    fi
}
