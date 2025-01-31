alias apinitvolta="ap_func_init_volta"
ap_func_init_volta() {
    export VOLTA_HOME="${HOME}/.volta"
    apaddpath "${VOLTA_HOME}/bin"

    alias zvoltatools='cd "${HOME}/.volta/tools"'
    alias zvoltaimgs='cd "${HOME}/.volta/tools/image"'
    alias zvoltanode='cd "${HOME}/.volta/tools/image/node"'
    alias zvoltapkgs='cd "${HOME}/.volta/tools/image/node"'

    if alias apinitvoltashare &>/dev/null; then
        apinitvoltashare
    fi

    if alias apinitvoltacommon &>/dev/null; then
        apinitvoltacommon
    fi
}

alias apcreatedirstructvolta="ap_func_create_dirstruct_volta"
ap_func_create_dirstruct_volta() {
    aplogshow "Generate [volta] bash autocomplete\n"
    "${HOME}/.volta/bin/volta" completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_volta.bash"

    if alias apcreatedirstructvoltashare &>/dev/null; then
        apcreatedirstructvoltashare
    fi

    if alias apcreatedirstructvoltacommon &>/dev/null; then
        apcreatedirstructvoltacommon
    fi
}

alias aprmdirstructvolta="ap_func_rm_dirstruct_volta"
ap_func_rm_dirstruct_volta() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_volta.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_volta.bash"

    if alias aprmdirstructvoltashare &>/dev/null; then
        aprmdirstructvoltashare
    fi

    if alias aprmdirstructvoltacommon &>/dev/null; then
        aprmdirstructvoltacommon
    fi
}

alias apcreateglobalsymlinkvolta="ap_func_create_global_symlink_volta"
ap_func_create_global_symlink_volta() {
    if [ -f "${AP_SOFT_DIR}/bin/volta" ]; then
        aplogshow "Create symlink from [/usr/local/bin/volta] to [${AP_SOFT_DIR}/bin/volta]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/volta" "/usr/local/bin/volta"
    fi
}

alias aprmglobalsymlinkvolta="ap_func_rm_global_symlink_volta"
ap_func_rm_global_symlink_volta() {
    if [ -f "/usr/local/bin/volta" ]; then
        aplogshow "Remove [/usr/local/bin/volta]\n"
        sudo rm -f "/usr/local/bin/volta"
    fi
}

alias apsetupvolta="ap_func_setup_volta"
ap_func_setup_volta() {
    # https://volta.sh/
    aplogshow "Install [volta]\n"

    # https://docs.volta.sh/advanced/installers#skipping-volta-setup
    # curl https://get.volta.sh | bash
    curl https://get.volta.sh | bash -s -- --skip-setup

    apinitvolta
    if alias apcreatedirstructvolta &>/dev/null; then
        apcreatedirstructvolta
    fi
}

alias aprmvolta="ap_func_rm_volta"
ap_func_rm_volta() {
    aplogshow "Remove [volta]\n"

    # volta modified `~/.profile`, please remove unnecessary lines related to volta
    rm -rf ~/.volta

    if alias aprmdirstructvolta &>/dev/null; then
        aprmdirstructvolta
    fi

    if alias aprmglobalsymlinkvolta &>/dev/null; then
        aprmglobalsymlinkvolta
    fi
}
