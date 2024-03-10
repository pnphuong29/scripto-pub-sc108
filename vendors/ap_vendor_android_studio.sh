alias apinitandroidstudio="ap_func_init_androidstudio"
ap_func_init_androidstudio() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        export ANDROID_HOME="${HOME}/Library/Android/sdk"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        export ANDROID_HOME="${HOME}/Android/Sdk"
        apaddpath "${AP_SOFT_DIR}/android-studio/bin"
    fi

    apaddpath "${ANDROID_HOME}/tools"
    apaddpath "${ANDROID_HOME}/tools/bin"
    apaddpath "${ANDROID_HOME}/platform-tools"
    apaddpath "${ANDROID_HOME}/cmdline-tools/latest/bin"
    apaddpath "${ANDROID_HOME}/build-tools/latest"
    apaddpath "${ANDROID_HOME}/emulator"

    if alias apinitandroidstudioshare &>/dev/null; then
        apinitandroidstudioshare
    fi

    if alias apinitandroidstudiocommon &>/dev/null; then
        apinitandroidstudiocommon
    fi
}

alias apcreatedirstructandroidstudio="ap_func_create_dirstruct_androidstudio"
ap_func_create_dirstruct_androidstudio() {
    # https://github.com/flutter/flutter/issues/118502
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        cd "/Applications/Android Studio.app/Contents"
        ln -s "/Applications/Android Studio.app/Contents/jbr" "/Applications/Android Studio.app/Contents/jre"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        cd "${AP_SOFT_DIR}/android-studio"
        ln -s "${AP_SOFT_DIR}/android-studio/jbr" "${AP_SOFT_DIR}/android-studio/jre"
    fi

    if alias apcreatedirstructandroidstudioshare &>/dev/null; then
        apcreatedirstructandroidstudioshare
    fi

    if alias apcreatedirstructandroidstudiocommon &>/dev/null; then
        apcreatedirstructandroidstudiocommon
    fi
}

alias aprmdirstructandroidstudio="ap_func_rm_dirstruct_androidstudio"
ap_func_rm_dirstruct_androidstudio() {
    if alias aprmdirstructandroidstudioshare &>/dev/null; then
        aprmdirstructandroidstudioshare
    fi

    if alias aprmdirstructandroidstudiocommon &>/dev/null; then
        aprmdirstructandroidstudiocommon
    fi
}

alias apsetupandroidstudio="ap_func_setup_androidstudio"
ap_func_setup_androidstudio() {
    # https://developer.android.com/studio/install
    local ap_android_studio_setup_version='2023.1.1.28'
    if [ -n "$1" ]; then
        ap_android_studio_setup_version="$1"
    fi

    aplogshow "Install [Android Studio] v${ap_android_studio_setup_version}\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/android-studio"
    rm -rf "${AP_TMP_DIR}/android-studio"

    mkdir -p "${AP_TMP_DIR}/android-studio"
    cd "${AP_TMP_DIR}/android-studio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.26/android-studio-2023.1.1.28-mac_arm.zip"
            unzip android-studio-2023.1.1.28-mac_arm.zip
            cd android-studio-2023.1.1.28-mac_arm
            # curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/install/2023.1.1.28/android-studio-2023.1.1.28-mac_arm.dmg"
            # hdiutil attach -nobrowse android-studio-2023.1.1.28-mac_arm.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.26/android-studio-2023.1.1.28-mac.zip"
            unzip android-studio-2023.1.1.28-mac.zip
            cd android-studio-2023.1.1.28-mac
            # curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/install/2023.1.1.28/android-studio-2023.1.1.28-mac.dmg"
            # hdiutil attach -nobrowse android-studio-2023.1.1.28-mac.dmg
        fi

        mv "Android Studio.app" /Applications/
        cd "/Applications/Android Studio.app"
        rm -rf "${AP_TMP_DIR}/android-studio"

        # cd "/Volumes/Android Studio - Hedgehog | 2023.1.1 Patch 2"
        # cp -R "Android Studio.app" /Applications/
        # cd "/Applications/Android Studio.app"
        # hdiutil detach "/Volumes/Android Studio - Hedgehog | 2023.1.1 Patch 2"
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

    apinitandroidstudio
    if alias apcreatedirstructandroidstudio &>/dev/null; then
        apcreatedirstructandroidstudio
    fi
}

alias aprmandroidstudio="ap_func_rm_androidstudio"
ap_func_rm_androidstudio() {
    aplogshow "Remove [Android Studio]\n"
    rm -rf "${AP_SOFT_DIR}/android-studio"
    rm -rf "${ANDROID_HOME}"

    if alias aprmdirstructandroidstudio &>/dev/null; then
        aprmdirstructandroidstudio
    fi

    if alias aprmglobalsymlinkandroidstudio &>/dev/null; then
        rmglobalsymlinkandroidstudio
    fi
}
