alias @initflutter="ap_func_init_flutter"
ap_func_init_flutter() {
    @addpath "${AP_SOFT_DIR}/flutter/bin"

    if alias @initfluttershare &>/dev/null; then
        @initfluttershare
    fi

    if alias @initfluttercommon &>/dev/null; then
        @initfluttercommon
    fi
}

alias @createdirstructflutter="ap_func_create_dirstruct_flutter"
ap_func_create_dirstruct_flutter() {
    @logshow "Generate [Flutter] bash autocomplete\n"
    flutter bash-completion >"${AP_COMPLETIONS_DIR}/ap_completion_flutter.bash"

    if alias @createdirstructfluttershare &>/dev/null; then
        @createdirstructfluttershare
    fi

    if alias @createdirstructfluttercommon &>/dev/null; then
        @createdirstructfluttercommon
    fi
}

alias @rmdirstructflutter="ap_func_rm_dirstruct_flutter"
ap_func_rm_dirstruct_flutter() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_flutter.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_flutter.bash"

    if alias @rmdirstructfluttershare &>/dev/null; then
        @rmdirstructfluttershare
    fi

    if alias @rmdirstructfluttercommon &>/dev/null; then
        @rmdirstructfluttercommon
    fi
}

alias @setupflutter="ap_func_setup_flutter"
ap_func_setup_flutter() {
    local ap_flutter_setup_version='3.16.9'
    if [ -n "$1" ]; then
        ap_flutter_setup_version="$1"
    fi

    @logshow "Install [Flutter] v${ap_flutter_setup_version}\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/flutter"
    rm -rf "${AP_TMP_DIR}/flutter"

    # Install flutter
    mkdir -p "${AP_TMP_DIR}/flutter"
    cd "${AP_TMP_DIR}/flutter"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SLO "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_${ap_flutter_setup_version}-stable.zip"
        unzip flutter_macos_*.zip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Install required libraries for Flutter development
        sudo apt install -y clang ninja-build libgtk-3-dev
        curl -SLO "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${ap_flutter_setup_version}-stable.tar.xz"
        tar -Jxf flutter_linux_*.tar.xz
    fi

    rm -f flutter_*
    # mv flutter* flutter
    mv flutter "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/flutter"
    rm -rf "${AP_TMP_DIR}/flutter"

    @initflutter
    if alias @createdirstructflutter &>/dev/null; then
        @createdirstructflutter
    fi
}

alias @rmflutter="ap_func_rm_flutter"
ap_func_rm_flutter() {
    @logshow "Remove [flutter]\n"
    rm -rf "${AP_SOFT_DIR}/flutter"

    if alias @rmdirstructflutter &>/dev/null; then
        @rmdirstructflutter
    fi

    if alias @rmglobalsymlinkflutter &>/dev/null; then
        @rmglobalsymlinkflutter
    fi
}
