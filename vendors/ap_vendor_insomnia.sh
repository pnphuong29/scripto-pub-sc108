alias apinitinsomnia="ap_func_init_insomnia"
ap_func_init_insomnia() {
    if alias apinitinsomniashare &>/dev/null; then
        apinitinsomniashare
    fi

    if alias apinitinsomniacommon &>/dev/null; then
        apinitinsomniacommon
    fi

    if alias apinitinsomniamain &>/dev/null; then
        apinitinsomniamain
    fi
}

alias apcreatedirstructinsomnia="ap_func_create_dirstruct_insomnia"
ap_func_create_dirstruct_insomnia() {
    if alias apcreatedirstructinsomniashare &>/dev/null; then
        apcreatedirstructinsomniashare
    fi

    if alias apcreatedirstructinsomniacommon &>/dev/null; then
        apcreatedirstructinsomniacommon
    fi

    if alias apcreatedirstructinsomniamain &>/dev/null; then
        apcreatedirstructinsomniamain
    fi
}

alias aprmdirstructinsomnia="ap_func_rm_dirstruct_insomnia"
ap_func_rm_dirstruct_insomnia() {
    if alias aprmdirstructinsomniashare &>/dev/null; then
        aprmdirstructinsomniashare
    fi

    if alias aprmdirstructinsomniacommon &>/dev/null; then
        aprmdirstructinsomniacommon
    fi

    if alias aprmdirstructinsomniamain &>/dev/null; then
        aprmdirstructinsomniamain
    fi
}

alias apsetupinsomnia="ap_func_setup_insomnia"
ap_func_setup_insomnia() {
    aplogshow "Install [insomnia]\n"

    mkdir -p "${AP_TMP_DIR}/insomnia"
    cd "${AP_TMP_DIR}/insomnia"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask insomnia
        curl -SOL https://github.com/Kong/insomnia/releases/download/lib%409.2.0/inso-macos-9.2.0.zip
        unzip inso-macos-9.2.0.zip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap install insomnia
        curl -SOL https://github.com/Kong/insomnia/releases/download/lib%409.2.0/inso-linux-9.2.0.tar.xz
        tar -xf inso-linux-9.2.0.tar.xz
    fi

    mv inso "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}/bin"
    rm -rf "${AP_TMP_DIR}/insomnia"

    apinitinsomnia
    if alias apcreatedirstructinsomnia &>/dev/null; then
        apcreatedirstructinsomnia
    fi
}

alias aprminsomnia="ap_func_rm_insomnia"
ap_func_rm_insomnia() {
    aplogshow "Remove [insomnia]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask insomnia
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge insomnia
    fi

    if alias aprmdirstructinsomnia &>/dev/null; then
        aprmdirstructinsomnia
    fi

    if alias aprmglobalsymlinkinsomnia &>/dev/null; then
        aprmglobalsymlinkinsomnia
    fi
}
