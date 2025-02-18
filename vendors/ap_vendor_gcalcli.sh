alias apinitgcalcli="ap_func_init_gcalcli"
ap_func_init_gcalcli() {
    alias zgcalcli="cd /Applications/gcalcli.app/Contents/MacOS"
    alias zgcalcli="cd \${HOME}/.gcalcli"
    alias zgcalcli="cd \${HOME}/.config/gcalcli"

    if alias apinitgcalclishare &>/dev/null; then
        apinitgcalclishare
    fi

    if alias apinitgcalclicommon &>/dev/null; then
        apinitgcalclicommon
    fi

    if alias apinitgcalclimain &>/dev/null; then
        apinitgcalclimain
    fi
}

alias apcreatedirstructgcalcli="ap_func_create_dirstruct_gcalcli"
ap_func_create_dirstruct_gcalcli() {
    if type activate-global-python-argcomplete &>/dev/null; then
        apshowmsginfo "Create bash completion for python at [${AP_COMPLETION_DIR}/ap_completion_python_argcomplete.bash]\n"
        activate-global-python-argcomplete --dest "${AP_COMPLETION_DIR}"
        mv "${AP_COMPLETION_DIR}/_python-argcomplete" "${AP_COMPLETION_DIR}/ap_completion_python_argcomplete.bash"
    fi

    if alias apcreatedirstructgcalclishare &>/dev/null; then
        apcreatedirstructgcalclishare
    fi

    if alias apcreatedirstructgcalclicommon &>/dev/null; then
        apcreatedirstructgcalclicommon
    fi

    if alias apcreatedirstructgcalclimain &>/dev/null; then
        apcreatedirstructgcalclimain
    fi
}

alias aprmdirstructgcalcli="ap_func_rm_dirstruct_gcalcli"
ap_func_rm_dirstruct_gcalcli() {
    apshowmsginfo "Remove [${AP_COMPLETION_DIR}/ap_completion_python_argcomplete.bash]\n"
    rm -f "${AP_COMPLETION_DIR}/ap_completion_python_argcomplete.bash"

    if alias aprmdirstructgcalclishare &>/dev/null; then
        aprmdirstructgcalclishare
    fi

    if alias aprmdirstructgcalclicommon &>/dev/null; then
        aprmdirstructgcalclicommon
    fi

    if alias aprmdirstructgcalclimain &>/dev/null; then
        aprmdirstructgcalclimain
    fi
}

# alias apcreateglobalsymlinkgcalcli="ap_func_create_global_symlink_gcalcli"
# ap_func_create_global_symlink_gcalcli() {
#     if [ -f "${AP_SOFT_DIR}/bin/gcalcli" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/gcalcli] to [${AP_SOFT_DIR}/bin/gcalcli]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/gcalcli" "/usr/local/bin/gcalcli"
#     fi
# }

# alias aprmglobalsymlinkgcalcli="ap_func_rm_global_symlink_gcalcli"
# ap_func_rm_global_symlink_gcalcli() {
#     if [ -f "/usr/local/bin/gcalcli" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/gcalcli]\n"
#         sudo rm -f "/usr/local/bin/gcalcli"
#     fi
# }

alias apsetupgcalcli="ap_func_setup_gcalcli"
ap_func_setup_gcalcli() {
    apshowmsginfo "Install [gcalcli]\n"

    pip install gcalcli[vobject]
    apinitgcalcli

    if alias apcreatedirstructgcalcli &>/dev/null; then
        apcreatedirstructgcalcli
    fi
}

alias aprmgcalcli="ap_func_rm_gcalcli"
ap_func_rm_gcalcli() {
    apshowmsginfo "Remove [gcalcli]\n"
    pip uninstall gcalcli argcomplete

    if alias aprmdirstructgcalcli &>/dev/null; then
        aprmdirstructgcalcli
    fi

    if alias aprmglobalsymlinkgcalcli &>/dev/null; then
        aprmglobalsymlinkgcalcli
    fi
}
