alias apinitflutter="ap_func_init_flutter"
ap_func_init_flutter() {
    export AP_DART_SDK_DIR="${AP_SOFT_DIR}/flutter/bin/cache/dart-sdk"

    apaddpath "${AP_SOFT_DIR}/flutter/bin"
    apaddpath "${AP_SOFT_DIR}/flutter/bin/cache/dart-sdk/bin"

    if alias apinitfluttershare &>/dev/null; then
        apinitfluttershare
    fi

    if alias apinitfluttercommon &>/dev/null; then
        apinitfluttercommon
    fi
}

alias apcreatedirstructflutter="ap_func_create_dirstruct_flutter"
ap_func_create_dirstruct_flutter() {
    aplogshow "Generate [Flutter] bash autocomplete\n"
    flutter bash-completion >"${AP_COMPLETIONS_DIR}/ap_completion_flutter.bash"

    if alias apcreatedirstructfluttershare &>/dev/null; then
        apcreatedirstructfluttershare
    fi

    if alias apcreatedirstructfluttercommon &>/dev/null; then
        apcreatedirstructfluttercommon
    fi
}

alias aprmdirstructflutter="ap_func_rm_dirstruct_flutter"
ap_func_rm_dirstruct_flutter() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_flutter.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_flutter.bash"

    if alias aprmdirstructfluttershare &>/dev/null; then
        aprmdirstructfluttershare
    fi

    if alias aprmdirstructfluttercommon &>/dev/null; then
        aprmdirstructfluttercommon
    fi
}

alias apsetupflutter="ap_func_setup_flutter"
ap_func_setup_flutter() {
    local ap_flutter_setup_version='3.27.2'
    if [ -n "$1" ]; then
        ap_flutter_setup_version="$1"
    fi

    aplogshow "Install [Flutter] v${ap_flutter_setup_version}\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/flutter"
    rm -rf "${AP_TMP_DIR}/flutter"

    # Install flutter
    mkdir -p "${AP_TMP_DIR}/flutter"
    cd "${AP_TMP_DIR}/flutter"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Some Flutter components require the Rosetta 2 translation process on Macs running Apple silicon.
        # To run all Flutter components on Apple silicon, install Rosetta 2.
        sudo softwareupdate --install-rosetta --agree-to-license
        curl -SLO "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_${ap_flutter_setup_version}-stable.zip"
        unzip flutter_macos_*.zip

        # Install and configure Xcode
        sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
        sudo xcodebuild -license
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

    apinitflutter
    if alias apcreatedirstructflutter &>/dev/null; then
        apcreatedirstructflutter
    fi
}

alias aprmflutter="ap_func_rm_flutter"
ap_func_rm_flutter() {
    aplogshow "Remove [flutter]\n"
    rm -rf "${AP_SOFT_DIR}/flutter"

    if alias aprmdirstructflutter &>/dev/null; then
        aprmdirstructflutter
    fi

    if alias aprmglobalsymlinkflutter &>/dev/null; then
        aprmglobalsymlinkflutter
    fi
}
