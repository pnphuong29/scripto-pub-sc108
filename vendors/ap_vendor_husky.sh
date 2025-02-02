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

alias apsetuphusky="ap_func_setup_husky"
ap_func_setup_husky() {
    apshowmsginfo "Install [husky]\n"

    pnpm install -g husky
    apinithusky

    if alias apcreatedirstructhusky &>/dev/null; then
        apcreatedirstructhusky
    fi
}

alias aprmhusky="ap_func_rm_husky"
ap_func_rm_husky() {
    apshowmsginfo "Remove [husky]\n"
    pnpm uninstall -g husky

    if alias aprmdirstructhusky &>/dev/null; then
        aprmdirstructhusky
    fi

    if alias aprmglobalsymlinkhusky &>/dev/null; then
        aprmglobalsymlinkhusky
    fi
}
