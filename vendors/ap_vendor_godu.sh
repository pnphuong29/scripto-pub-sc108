alias apinitgodu="ap_func_init_godu"
ap_func_init_godu() {
    alias godufileslargerthanmb='godu -l'
    alias goduprintfiles='godu -print0'
    alias goduprintfileslargerthanmb='godu -print0 -l'

    if alias apinitgodushare &>/dev/null; then
        apinitgodushare
    fi

    if alias apinitgoducommon &>/dev/null; then
        apinitgoducommon
    fi

    if alias apinitgodumain &>/dev/null; then
        apinitgodumain
    fi
}

alias apcreatedirstructgodu="ap_func_create_dirstruct_godu"
ap_func_create_dirstruct_godu() {
    if alias apcreatedirstructgodushare &>/dev/null; then
        apcreatedirstructgodushare
    fi

    if alias apcreatedirstructgoducommon &>/dev/null; then
        apcreatedirstructgoducommon
    fi

    if alias apcreatedirstructgodumain &>/dev/null; then
        apcreatedirstructgodumain
    fi
}

alias aprmdirstructgodu="ap_func_rm_dirstruct_godu"
ap_func_rm_dirstruct_godu() {
    if alias aprmdirstructgodushare &>/dev/null; then
        aprmdirstructgodushare
    fi

    if alias aprmdirstructgoducommon &>/dev/null; then
        aprmdirstructgoducommon
    fi

    if alias aprmdirstructgodumain &>/dev/null; then
        aprmdirstructgodumain
    fi
}

alias apcreateglobalsymlinkgodu="ap_func_create_global_symlink_godu"
ap_func_create_global_symlink_godu() {
    if [ -f "${GOPATH}/bin/godu" ]; then
        aplogshow "Create symlink from [/usr/local/bin/godu] to [${GOPATH}/bin/godu]\n"
        sudo ln -sf "${GOPATH}/bin/godu" "/usr/local/bin/godu"
    fi
}

alias aprmglobalsymlinkgodu="ap_func_rm_global_symlink_godu"
ap_func_rm_global_symlink_godu() {
    if [ -f "/usr/local/bin/godu" ]; then
        aplogshow "Remove [/usr/local/bin/godu]\n"
        sudo rm -f "/usr/local/bin/godu"
    fi
}

alias apsetupgodu="ap_func_setup_godu"
ap_func_setup_godu() {
    aplogshow "Install [godu]\n"

    go install github.com/viktomas/godu@latest
    apinitgodu
    apcreateglobalsymlinkgodu

    if alias apcreatedirstructgodu &>/dev/null; then
        apcreatedirstructgodu
    fi
}

alias aprmgodu="ap_func_rm_godu"
ap_func_rm_godu() {
    aplogshow "Remove [godu]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/viktomas/godu@"*
    rm -f "${GOPATH}/bin/godu"

    if alias aprmdirstructgodu &>/dev/null; then
        aprmdirstructgodu
    fi

    if alias aprmglobalsymlinkgodu &>/dev/null; then
        aprmglobalsymlinkgodu
    fi
}
