alias @initdart="ap_func_init_dart"
ap_func_init_dart() {
    @addpath "${AP_SOFT_DIR}/dart/bin"

    if alias @initdartshare &>/dev/null; then
        @initdartshare
    fi

    if alias @initdartcommon &>/dev/null; then
        @initdartcommon
    fi
}

alias @createdirstructdart="ap_func_create_dirstruct_dart"
ap_func_create_dirstruct_dart() {
    if alias @createdirstructdartshare &>/dev/null; then
        @createdirstructdartshare
    fi

    if alias @createdirstructdartcommon &>/dev/null; then
        @createdirstructdartcommon
    fi
}

alias @rmdirstructdart="ap_func_rm_dirstruct_dart"
ap_func_rm_dirstruct_dart() {
    if alias @rmdirstructdartshare &>/dev/null; then
        @rmdirstructdartshare
    fi

    if alias @rmdirstructdartcommon &>/dev/null; then
        @rmdirstructdartcommon
    fi
}

alias @setupdart="ap_func_setup_dart"
ap_func_setup_dart() {
    # https://dart.dev/get-dart/archive
    local ap_dart_setup_version='3.2.6'
    if [ -n "$1" ]; then
        ap_dart_setup_version="$1"
    fi

    # @logshow "Install [dart]\n"
    @logshow "Install [Dart] v${ap_dart_setup_version}\n"

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

    @initdart
    if alias @createdirstructdart &>/dev/null; then
        @createdirstructdart
    fi
}

alias @rmdart="ap_func_rm_dart"
ap_func_rm_dart() {
    @logshow "Remove [Dart]\n"
    rm -rf "${AP_SOFT_DIR}/dart"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew untap dart-lang/dart
    #     brew remove dart
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo rm -f /etc/apt/sources.list.d/dart_stable.list
    #     sudo apt purge -y dart
    # fi

    if alias @rmdirstructdart &>/dev/null; then
        @rmdirstructdart
    fi

    if alias @rmglobalsymlinkdart &>/dev/null; then
        @rmglobalsymlinkdart
    fi
}
