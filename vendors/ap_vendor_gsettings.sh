alias @initgsettings="ap_func_init_gsettings"
ap_func_init_gsettings() {
    if alias @initgsettingsshare &>/dev/null; then
        @initgsettingsshare
    fi

    if alias @initgsettingscommon &>/dev/null; then
        @initgsettingscommon
    fi
}

alias @createdirstructgsettings="ap_func_create_dirstruct_gsettings"
ap_func_create_dirstruct_gsettings() {
    if alias @createdirstructgsettingsshare &>/dev/null; then
        @createdirstructgsettingsshare
    fi

    if alias @createdirstructgsettingscommon &>/dev/null; then
        @createdirstructgsettingscommon
    fi
}

alias @rmdirstructgsettings="ap_func_rm_dirstruct_gsettings"
ap_func_rm_dirstruct_gsettings() {
    if alias @rmdirstructgsettingsshare &>/dev/null; then
        @rmdirstructgsettingsshare
    fi

    if alias @rmdirstructgsettingscommon &>/dev/null; then
        @rmdirstructgsettingscommon
    fi
}
