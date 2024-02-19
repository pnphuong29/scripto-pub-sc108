alias @initandroidstudio="ap_func_init_androidstudio"
ap_func_init_androidstudio() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        export ANDROID_HOME="${HOME}/Library/Android/sdk"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        export ANDROID_HOME="${HOME}/Android/Sdk"
        @addpath "${AP_SOFT_DIR}/android-studio/bin"
    fi

    @addpath "${ANDROID_HOME}/tools"
    @addpath "${ANDROID_HOME}/tools/bin"
    @addpath "${ANDROID_HOME}/platform-tools"
    @addpath "${ANDROID_HOME}/cmdline-tools/latest/bin"
    @addpath "${ANDROID_HOME}/build-tools/latest"
    @addpath "${ANDROID_HOME}/emulator"

    if alias @initandroidstudioshare &>/dev/null; then
        @initandroidstudioshare
    fi

    if alias @initandroidstudiocommon &>/dev/null; then
        @initandroidstudiocommon
    fi
}

alias @createdirstructandroidstudio="ap_func_create_dirstruct_androidstudio"
ap_func_create_dirstruct_androidstudio() {
    # https://github.com/flutter/flutter/issues/118502
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # TODO: Update configure Android Studio in macOS
        echo "Fill in codes for [createdirstructandroidstudio]"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        cd "${AP_SOFT_DIR}/android-studio"
        ln -s "${AP_SOFT_DIR}/android-studio/jbr" "${AP_SOFT_DIR}/android-studio/jre"
    fi

    if alias @createdirstructandroidstudioshare &>/dev/null; then
        @createdirstructandroidstudioshare
    fi

    if alias @createdirstructandroidstudiocommon &>/dev/null; then
        @createdirstructandroidstudiocommon
    fi
}

alias @rmdirstructandroidstudio="ap_func_rm_dirstruct_androidstudio"
ap_func_rm_dirstruct_androidstudio() {
    if alias @rmdirstructandroidstudioshare &>/dev/null; then
        @rmdirstructandroidstudioshare
    fi

    if alias @rmdirstructandroidstudiocommon &>/dev/null; then
        @rmdirstructandroidstudiocommon
    fi
}

alias @setupandroidstudio="ap_func_setup_androidstudio"
ap_func_setup_androidstudio() {
    # https://developer.android.com/studio/install
    local ap_android_studio_setup_version='2023.1.1.28'
    if [ -n "$1" ]; then
        ap_android_studio_setup_version="$1"
    fi

    @logshow "Install [Android Studio] v${ap_android_studio_setup_version}\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/android-studio"
    rm -rf "${AP_TMP_DIR}/android-studio"

    mkdir -p "${AP_TMP_DIR}/android-studio"
    cd "${AP_TMP_DIR}/android-studio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # TODO: Setup in macos using download file, not hdiutil
        if [[ "$(uname -m)" == 'arm64' ]]; then
            # curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/install/2023.3.1.10/android-studio-2023.3.1.10-mac_arm.dmg"
            curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/install/2023.1.1.28/android-studio-2023.1.1.28-mac_arm.dmg"
            hdiutil attach -nobrowse android-studio-2023.1.1.28-mac_arm.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            # curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.3.1.10/android-studio-2023.3.1.10-mac.zip"
            curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/install/2023.1.1.28/android-studio-2023.1.1.28-mac.dmg"
            hdiutil attach -nobrowse android-studio-2023.1.1.28-mac.dmg
        fi

        cd "/Volumes/Android Studio - Hedgehog | 2023.1.1 Patch 2"
        cp -R "Android Studio.app" /Applications/
        cd "/Applications/Android Studio.app"
        hdiutil detach "/Volumes/Android Studio - Hedgehog | 2023.1.1 Patch 2"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux
        # Install required libraries
        sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

        # Install Android Studio
        curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${ap_android_studio_setup_version}/android-studio-${ap_android_studio_setup_version}-linux.tar.gz"
        tar -zxf android-studio-*.tar.gz
        rm -f android-studio-*.tar.gz
        mv android-studio "${AP_SOFT_DIR}/"
        cd "${AP_SOFT_DIR}/android-studio"
        rm -rf "${AP_TMP_DIR}/android-studio"
    fi

    @initandroidstudio
    if alias @createdirstructandroidstudio &>/dev/null; then
        @createdirstructandroidstudio
    fi
}

alias @rmandroidstudio="ap_func_rm_androidstudio"
ap_func_rm_androidstudio() {
    @logshow "Remove [Android Studio]\n"
    rm -rf "${AP_SOFT_DIR}/android-studio"
    rm -rf "${ANDROID_HOME}"

    if alias @rmdirstructandroidstudio &>/dev/null; then
        @rmdirstructandroidstudio
    fi

    if alias @rmglobalsymlinkandroidstudio &>/dev/null; then
        @rmglobalsymlinkandroidstudio
    fi
}
