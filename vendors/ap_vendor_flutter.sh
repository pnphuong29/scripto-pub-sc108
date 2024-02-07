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
    @logshow "Generate [flutter] bash autocomplete\n"
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
    local ap_flutter_setup_version=''
    if [ -n "$1" ]; then
        ap_flutter_setup_version="$1"
    fi

    @logshow "Install [flutter] v${ap_flutter_setup_version}\n"

    @logshow "Install [flutter]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/flutter"
    rm -rf "${AP_TMP_DIR}/flutter"

    # Install flutter
    mkdir -p "${AP_TMP_DIR}/flutter"
    cd "${AP_TMP_DIR}/flutter"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/flutter/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >flutter.tar.gz
        unzip flutter.zip
        mv flutter* flutter
        rm -rf "/Applications/flutter"
        mv "flutter/flutter.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse flutter.dmg
        cd "/Volumes/flutter"
        cp -R flutter.app /Applications/
        hdiutil detach "/Volumes/flutter"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/flutter/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >flutter.tar.gz
        sudo dpkg -i flutter.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/flutter/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >flutter.tar.gz

    tar -zxf flutter.tar.gz
    rm -f flutter.tar.gz
    mv flutter* flutter
    mv flutter "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/flutter"
    rm -rf "${AP_TMP_DIR}/flutter"

    pip install flutter
    npm install -g flutter

    @initflutter
    if alias @createdirstructflutter &>/dev/null; then
        @createdirstructflutter
    fi
}

alias @rmflutter="ap_func_rm_flutter"
ap_func_rm_flutter() {
    local ap_flutter_remove_version=''
    if [ -n "$1" ]; then
        ap_flutter_remove_version="$1"
    fi

    @logshow "Remove [flutter] v${ap_flutter_remove_version}\n"

    @logshow "Remove [flutter]\n"
    pip uninstall flutter
    npm uninstall -g flutter

    rm -rf "${AP_SOFT_DIR}/flutter"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask flutter
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y flutter
    fi

    if alias @rmdirstructflutter &>/dev/null; then
        @rmdirstructflutter
    fi

    if alias @rmglobalsymlinkflutter &>/dev/null; then
        @rmglobalsymlinkflutter
    fi
}
