alias apinitandroidstudio="ap_func_init_androidstudio"
ap_func_init_androidstudio() {
    export AP_ANDROID_STUDIO_SETUP_VERSION='2024.2.2.13'

    if alias apinitandroidstudioshare &>/dev/null; then
        apinitandroidstudioshare
    fi

    if alias apinitandroidstudiocommon &>/dev/null; then
        apinitandroidstudiocommon
    fi
}

alias apcreatedirstructandroidstudio="ap_func_create_dirstruct_androidstudio"
ap_func_create_dirstruct_androidstudio() {
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
    local ap_android_studio_setup_version="${AP_ANDROID_STUDIO_SETUP_VERSION}"
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
            # curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${ap_android_studio_setup_version}/android-studio-${ap_android_studio_setup_version}-mac_arm.zip"
            # unzip android-studio-${ap_android_studio_setup_version}-mac_arm.zip
            # cd android-studio-${ap_android_studio_setup_version}-mac_arm
            curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/install/${ap_android_studio_setup_version}/android-studio-${ap_android_studio_setup_version}-mac_arm.dmg"
            hdiutil attach -nobrowse android-studio-${ap_android_studio_setup_version}-mac_arm.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            # curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/${ap_android_studio_setup_version}/android-studio-${ap_android_studio_setup_version}-mac.zip"
            # unzip android-studio-${ap_android_studio_setup_version}-mac.zip
            # cd android-studio-${ap_android_studio_setup_version}-mac
            curl -SLO "https://redirector.gvt1.com/edgedl/android/studio/install/${ap_android_studio_setup_version}/android-studio-${ap_android_studio_setup_version}-mac.dmg"
            hdiutil attach -nobrowse android-studio-${ap_android_studio_setup_version}-mac.dmg
        fi

        # mv "Android Studio.app" /Applications/
        # cd "/Applications/Android Studio.app"
        # rm -rf "${AP_TMP_DIR}/android-studio"

        cd "/Volumes/Android Studio - Ladybug | 2024.2.1 Patch 3"
        cp -R "Android Studio.app" /Applications/
        cd "/Applications/Android Studio.app"
        hdiutil detach "/Volumes/Android Studio - Ladybug | 2024.2.1 Patch 3"
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
    local ap_android_studio_setup_version="${AP_ANDROID_STUDIO_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_android_studio_setup_version="$1"
    fi

    aplogshow "Remove [Android Studio] v[${ap_android_studio_setup_version}]\n"
    rm -rf "${AP_SOFT_DIR}/android-studio"
    rm -rf "${ANDROID_HOME}"

    if alias aprmdirstructandroidstudio &>/dev/null; then
        aprmdirstructandroidstudio
    fi

    if alias aprmglobalsymlinkandroidstudio &>/dev/null; then
        aprmglobalsymlinkandroidstudio
    fi
}
