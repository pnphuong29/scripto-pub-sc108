alias apinittcl="ap_func_init_tcl"
ap_func_init_tcl() {
    if alias apinittclshare &>/dev/null; then
        apinittclshare
    fi

    if alias apinittclcommon &>/dev/null; then
        apinittclcommon
    fi

    if alias apinittclmain &>/dev/null; then
        apinittclmain
    fi
}

alias apcreatedirstructtcl="ap_func_create_dirstruct_tcl"
ap_func_create_dirstruct_tcl() {
    if alias apcreatedirstructtclshare &>/dev/null; then
        apcreatedirstructtclshare
    fi

    if alias apcreatedirstructtclcommon &>/dev/null; then
        apcreatedirstructtclcommon
    fi

    if alias apcreatedirstructtclmain &>/dev/null; then
        apcreatedirstructtclmain
    fi
}

alias aprmdirstructtcl="ap_func_rm_dirstruct_tcl"
ap_func_rm_dirstruct_tcl() {
    if alias aprmdirstructtclshare &>/dev/null; then
        aprmdirstructtclshare
    fi

    if alias aprmdirstructtclcommon &>/dev/null; then
        aprmdirstructtclcommon
    fi

    if alias aprmdirstructtclmain &>/dev/null; then
        aprmdirstructtclmain
    fi
}

alias apsetuptcl="ap_func_setup_tcl"
ap_func_setup_tcl() {
    apshowmsginfo "Install [tcl]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install tcl-tk

        # Below libraries are required for building Python with tcl/tk support
        brew install openssl readline sqlite3 xz zlib
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y tcl tk tk-dev

        # Below libraries are required for building Python with tcl/tk support via tkinter
        sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
            libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
            xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
    fi

    apinittcl
    if alias apcreatedirstructtcl &>/dev/null; then
        apcreatedirstructtcl
    fi
}

alias aprmtcl="ap_func_rm_tcl"
ap_func_rm_tcl() {
    apshowmsginfo "Remove [tcl]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask tcl
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt-get remove --purge -y tcl
        sudo apt-get autoremove --purge -y
    fi

    if alias aprmdirstructtcl &>/dev/null; then
        aprmdirstructtcl
    fi

    if alias aprmglobalsymlinktcl &>/dev/null; then
        aprmglobalsymlinktcl
    fi
}
