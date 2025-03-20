alias apinitpostman="ap_func_init_postman"
ap_func_init_postman() {
    if alias apinitpostmanshare &>/dev/null; then
        apinitpostmanshare
    fi

    if alias apinitpostmancommon &>/dev/null; then
        apinitpostmancommon
    fi

    if alias apinitpostmanmain &>/dev/null; then
        apinitpostmanmain
    fi
}

alias apcreatedirstructpostman="ap_func_create_dirstruct_postman"
ap_func_create_dirstruct_postman() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Create a symbolic link to the Postman executable
        apshowmsginfo "Creating symbolic link from [${AP_SOFT_DIR}/bin/postman] to [${AP_SOFT_DIR}/postman/Postman]\n"
        ln -sf "${AP_SOFT_DIR}/postman/Postman" "${AP_SOFT_DIR}/bin/postman"

        # Create a desktop entry for Postman
        apshowmsginfo "Creating desktop entry at [${HOME}/.local/share/applications/postman.desktop]\n"
        cat <<-EOL | tee "${HOME}/.local/share/applications/postman.desktop" >/dev/null
[Desktop Entry]
Name=Postman
Comment=Make and view API requests
Exec=${AP_SOFT_DIR}/postman/Postman
Icon=${AP_SOFT_DIR}/postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;Utility;
EOL
    fi

    if alias apcreatedirstructpostmanshare &>/dev/null; then
        apcreatedirstructpostmanshare
    fi

    if alias apcreatedirstructpostmancommon &>/dev/null; then
        apcreatedirstructpostmancommon
    fi

    if alias apcreatedirstructpostmanmain &>/dev/null; then
        apcreatedirstructpostmanmain
    fi
}

alias aprmdirstructpostman="ap_func_rm_dirstruct_postman"
ap_func_rm_dirstruct_postman() {
    rm -f "${AP_SOFT_DIR}/bin/postman"
    rm -f "${HOME}/.local/share/applications/postman.desktop"

    if alias aprmdirstructpostmanshare &>/dev/null; then
        aprmdirstructpostmanshare
    fi

    if alias aprmdirstructpostmancommon &>/dev/null; then
        aprmdirstructpostmancommon
    fi

    if alias aprmdirstructpostmanmain &>/dev/null; then
        aprmdirstructpostmanmain
    fi
}

alias apsetuppostman="ap_func_setup_postman"
ap_func_setup_postman() {
    apshowmsginfo "Install [postman]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Define the URL for the latest Postman tarball
        POSTMAN_URL="https://dl.pstmn.io/download/latest/osx"

        # Define the download target file
        TARGET_FILE="${AP_TMP_DIR}/postman.zip"

        # Define the target directory
        TARGET_DIR="/Applications/Postman.app"

        # Download the Postman zip file
        apshowmsginfo "Downloading Postman...\n"
        curl -o "${TARGET_FILE}" "${POSTMAN_URL}"

        # Remove any existing Postman application
        if [ -d "${TARGET_DIR}" ]; then
            apshowmsginfo "Removing existing Postman application [/Applications/Postman.app]"
            rm -rf "${TARGET_DIR}"
        fi

        # Unzip the downloaded file to the Applications directory
        apshowmsginfo "Extracting Postman...\n"
        unzip "${TARGET_FILE}" -d /Applications

        # Clean up the zip file
        apshowmsginfo "Cleaning up...\n"
        rm "${TARGET_FILE}"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Define the URL for the latest Postman tarball
        POSTMAN_URL="https://dl.pstmn.io/download/latest/linux64"

        # Download the Postman tarball
        apshowmsginfo "Downloading Postman...\n"
        wget -O "${AP_TMP_DIR}/postman.tar.gz" "${POSTMAN_URL}"

        # Remove any existing Postman directory
        if [ -d "${AP_SOFT_DIR}/postman" ]; then
            apshowmsginfo "Removing existing Postman directory [${AP_SOFT_DIR}/postman]\n"
            rm -rf "${AP_SOFT_DIR}/postman"
        fi

        # Extract the tarball to the target directory
        apshowmsginfo "Extracting Postman...\n"
        tar -xzvf "${AP_TMP_DIR}/postman.tar.gz" -C "${AP_SOFT_DIR}"

        # Rename target dir
        apshowmsginfo "Rename [${AP_SOFT_DIR}/Postman] to [${AP_SOFT_DIR}/postman\n"
        mv "${AP_SOFT_DIR}/Postman" "${AP_SOFT_DIR}/postman"

        # Clean up the tarball
        apshowmsginfo "Cleaning up...\n"
        rm "${AP_TMP_DIR}/postman.tar.gz"
    fi

    apinitpostman
    if alias apcreatedirstructpostman &>/dev/null; then
        apcreatedirstructpostman
    fi
}

alias aprmpostman="ap_func_rm_postman"
ap_func_rm_postman() {
    apshowmsginfo "Remove [postman]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Postman.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/postman"
    fi

    if alias aprmdirstructpostman &>/dev/null; then
        aprmdirstructpostman
    fi

    if alias aprmglobalsymlinkpostman &>/dev/null; then
        aprmglobalsymlinkpostman
    fi
}
