alias @initandroidstudio="ap_func_init_androidstudio"
ap_func_init_androidstudio() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        export ANDROID_HOME="${HOME}/Library/Android/sdk"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        export ANDROID_HOME="${HOME}/Library/Android/sdk"
    fi

    @addpath "${ANDROID_HOME}/tools"
    @addpath "${ANDROID_HOME}/tools/bin"
    @addpath "${ANDROID_HOME}/platform-tools"

    if alias @initandroidstudioshare &>/dev/null; then
        @initandroidstudioshare
    fi

    if alias @initandroidstudiocommon &>/dev/null; then
        @initandroidstudiocommon
    fi
}

alias @createdirstructandroidstudio="ap_func_create_dirstruct_androidstudio"
ap_func_create_dirstruct_androidstudio() {
    @logshow "Generate [androidstudio] bash autocomplete\n"
    androidstudio >"${AP_COMPLETIONS_DIR}/ap_completion_androidstudio.bash"

    if alias @createdirstructandroidstudioshare &>/dev/null; then
        @createdirstructandroidstudioshare
    fi

    if alias @createdirstructandroidstudiocommon &>/dev/null; then
        @createdirstructandroidstudiocommon
    fi
}

alias @rmdirstructandroidstudio="ap_func_rm_dirstruct_androidstudio"
ap_func_rm_dirstruct_androidstudio() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_androidstudio.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_androidstudio.bash"

    if alias @rmdirstructandroidstudioshare &>/dev/null; then
        @rmdirstructandroidstudioshare
    fi

    if alias @rmdirstructandroidstudiocommon &>/dev/null; then
        @rmdirstructandroidstudiocommon
    fi
}

alias @setupandroidstudio="ap_func_setup_androidstudio"
ap_func_setup_androidstudio() {
    local ap_androidstudio_setup_version=''
    if [ -n "$1" ]; then
        ap_androidstudio_setup_version="$1"
    fi

    @logshow "Install [androidstudio] v${ap_androidstudio_setup_version}\n"

    @logshow "Install [androidstudio]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/androidstudio"
    rm -rf "${AP_TMP_DIR}/androidstudio"

    # Install androidstudio
    mkdir -p "${AP_TMP_DIR}/androidstudio"
    cd "${AP_TMP_DIR}/androidstudio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/androidstudio/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >androidstudio.tar.gz
        unzip androidstudio.zip
        mv androidstudio* androidstudio
        rm -rf "/Applications/androidstudio"
        mv "androidstudio/androidstudio.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse androidstudio.dmg
        cd "/Volumes/androidstudio"
        cp -R androidstudio.app /Applications/
        hdiutil detach "/Volumes/androidstudio"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/owner/androidstudio/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >androidstudio.tar.gz
        sudo dpkg -i androidstudio.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/androidstudio/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >androidstudio.tar.gz

    tar -zxf androidstudio.tar.gz
    rm -f androidstudio.tar.gz
    mv androidstudio* androidstudio
    mv androidstudio "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/androidstudio"
    rm -rf "${AP_TMP_DIR}/androidstudio"

    pip install androidstudio
    npm install -g androidstudio

    @initandroidstudio
    if alias @createdirstructandroidstudio &>/dev/null; then
        @createdirstructandroidstudio
    fi
}

alias @rmandroidstudio="ap_func_rm_androidstudio"
ap_func_rm_androidstudio() {
    local ap_androidstudio_remove_version=''
    if [ -n "$1" ]; then
        ap_androidstudio_remove_version="$1"
    fi

    @logshow "Remove [androidstudio] v${ap_androidstudio_remove_version}\n"

    @logshow "Remove [androidstudio]\n"
    pip uninstall androidstudio
    npm uninstall -g androidstudio

    rm -rf "${AP_SOFT_DIR}/androidstudio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask androidstudio
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y androidstudio
    fi

    if alias @rmdirstructandroidstudio &>/dev/null; then
        @rmdirstructandroidstudio
    fi

    if alias @rmglobalsymlinkandroidstudio &>/dev/null; then
        @rmglobalsymlinkandroidstudio
    fi
}
