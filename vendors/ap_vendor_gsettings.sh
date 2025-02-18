alias apinitgsettings="ap_func_init_gsettings"
ap_func_init_gsettings() {
    if alias apinitgsettingsshare &>/dev/null; then
        apinitgsettingsshare
    fi

    if alias apinitgsettingscommon &>/dev/null; then
        apinitgsettingscommon
    fi
}

alias apcreatedirstructgsettings="ap_func_create_dirstruct_gsettings"
ap_func_create_dirstruct_gsettings() {
    if alias apcreatedirstructgsettingsshare &>/dev/null; then
        apcreatedirstructgsettingsshare
    fi

    if alias apcreatedirstructgsettingscommon &>/dev/null; then
        apcreatedirstructgsettingscommon
    fi
}

alias aprmdirstructgsettings="ap_func_rm_dirstruct_gsettings"
ap_func_rm_dirstruct_gsettings() {
    if alias aprmdirstructgsettingsshare &>/dev/null; then
        aprmdirstructgsettingsshare
    fi

    if alias aprmdirstructgsettingscommon &>/dev/null; then
        aprmdirstructgsettingscommon
    fi
}
