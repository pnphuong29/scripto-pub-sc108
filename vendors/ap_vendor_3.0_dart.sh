alias apinitdart="ap_func_init_dart"
ap_func_init_dart() {
    export AP_DART_SETUP_VERSION='3.6.1'
    apaddpath "${AP_SOFT_DIR}/dart/bin"

    if alias apinitdartshare &>/dev/null; then
        apinitdartshare
    fi

    if alias apinitdartcommon &>/dev/null; then
        apinitdartcommon
    fi
}

alias apcreatedirstructdart="ap_func_create_dirstruct_dart"
ap_func_create_dirstruct_dart() {
    if alias apcreatedirstructdartshare &>/dev/null; then
        apcreatedirstructdartshare
    fi

    if alias apcreatedirstructdartcommon &>/dev/null; then
        apcreatedirstructdartcommon
    fi
}

alias aprmdirstructdart="ap_func_rm_dirstruct_dart"
ap_func_rm_dirstruct_dart() {
    if alias aprmdirstructdartshare &>/dev/null; then
        aprmdirstructdartshare
    fi

    if alias aprmdirstructdartcommon &>/dev/null; then
        aprmdirstructdartcommon
    fi
}

alias apsetupdart="ap_func_setup_dart"
ap_func_setup_dart() {
    # https://dart.dev/get-dart/archive
    local ap_dart_setup_version="${AP_DART_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_dart_setup_version="$1"
    fi

    # aplogshow "Install [dart]\n"
    aplogshow "Install [Dart] v${ap_dart_setup_version}\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/dart"
    rm -rf "${AP_TMP_DIR}/dart"

    # Install dart
    mkdir -p "${AP_TMP_DIR}/dart"
    cd "${AP_TMP_DIR}/dart"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Install using brew
        # brew tap dart-lang/dart
        # brew install dart
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SOL "https://storage.googleapis.com/dart-archive/channels/stable/release/${ap_dart_setup_version}/sdk/dartsdk-macos-arm64-release.zip"
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SOL "https://storage.googleapis.com/dart-archive/channels/stable/release/${ap_dart_setup_version}/sdk/dartsdk-macos-x64-release.zip"
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Install using apt
        # sudo apt-get update
        # sudo apt-get install apt-transport-https
        # wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
        # echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

        # sudo apt-get update
        # sudo apt-get install -y dart
        curl -SOL "https://storage.googleapis.com/dart-archive/channels/stable/release/${ap_dart_setup_version}/sdk/dartsdk-linux-x64-release.zip"
    fi

    unzip dartsdk-*.zip
    mv dart-sdk "${AP_SOFT_DIR}/"
    mv "${AP_SOFT_DIR}/dart-sdk" "${AP_SOFT_DIR}/dart"
    cd "${AP_SOFT_DIR}/dart"

    apinitdart
    if alias apcreatedirstructdart &>/dev/null; then
        apcreatedirstructdart
    fi
}

alias aprmdart="ap_func_rm_dart"
ap_func_rm_dart() {
    aplogshow "Remove [Dart]\n"
    rm -rf "${AP_SOFT_DIR}/dart"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew untap dart-lang/dart
    #     brew remove dart
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo rm -f /etc/apt/sources.list.d/dart_stable.list
    #     sudo apt purge -y dart
    # fi

    if alias aprmdirstructdart &>/dev/null; then
        aprmdirstructdart
    fi

    if alias aprmglobalsymlinkdart &>/dev/null; then
        aprmglobalsymlinkdart
    fi
}
