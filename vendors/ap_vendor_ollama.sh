alias apinitollama="ap_func_init_ollama"
ap_func_init_ollama() {
    export AP_OLLAMA_DIR="${HOME}/.ollama"

    if alias apinitollamashare &>/dev/null; then
        apinitollamashare
    fi

    if alias apinitollamacommon &>/dev/null; then
        apinitollamacommon
    fi

    if alias apinitollamamain &>/dev/null; then
        apinitollamamain
    fi
}

alias apcreatedirstructollama="ap_func_create_dirstruct_ollama"
ap_func_create_dirstruct_ollama() {
    if alias apcreatedirstructollamashare &>/dev/null; then
        apcreatedirstructollamashare
    fi

    if alias apcreatedirstructollamacommon &>/dev/null; then
        apcreatedirstructollamacommon
    fi

    if alias apcreatedirstructollamamain &>/dev/null; then
        apcreatedirstructollamamain
    fi
}

alias aprmdirstructollama="ap_func_rm_dirstruct_ollama"
ap_func_rm_dirstruct_ollama() {
    if alias aprmdirstructollamashare &>/dev/null; then
        aprmdirstructollamashare
    fi

    if alias aprmdirstructollamacommon &>/dev/null; then
        aprmdirstructollamacommon
    fi

    if alias aprmdirstructollamamain &>/dev/null; then
        aprmdirstructollamamain
    fi
}

alias apcreateglobalsymlinkollama="ap_func_create_global_symlink_ollama"
ap_func_create_global_symlink_ollama() {
    if [ -f "${AP_SOFT_DIR}/bin/ollama" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/ollama] to [${AP_SOFT_DIR}/bin/ollama]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/ollama" "/usr/local/bin/ollama"
    fi
}

alias aprmglobalsymlinkollama="ap_func_rm_global_symlink_ollama"
ap_func_rm_global_symlink_ollama() {
    if [ -f "/usr/local/bin/ollama" ]; then
        apshowmsginfo "Remove [/usr/local/bin/ollama]\n"
        sudo rm -f "/usr/local/bin/ollama"
    fi
}

alias apsetupollama="ap_func_setup_ollama"
ap_func_setup_ollama() {
    aplogshow "Install [ollama]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/ollama"
    rm -rf "${AP_TMP_DIR}/ollama"

    # Install ollama
    mkdir -p "${AP_TMP_DIR}/ollama"
    cd "${AP_TMP_DIR}/ollama"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # GUI app
        # curl -SL \
        #     "$(curl --silent "https://api.github.com/repos/ollama/ollama/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep zip)" >ollama.zip

        # unzip ollama.zip
        # rm -rf "/Applications/Ollama"
        # mv Ollama.app /Applications/

        # CLI app
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/ollama/ollama/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep -v zip)" >ollama

        rm -f "${AP_SOFT_DIR}/bin/ollama"
        chmod +x ollama
        mv ollama "${AP_SOFT_DIR}/bin/"
        cd "/Applications"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/ollama/ollama/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep "amd64" | grep -v rocm)" >ollama.tgz
        tar -zxf ollama.tgz
        # rm -f ollama.tgz
        mkdir -p "${AP_SOFT_DIR}/ollama"
        mv bin "${AP_SOFT_DIR}/ollama/"
        mv lib "${AP_SOFT_DIR}/ollama/"
        cd "${AP_SOFT_DIR}"

        if [ -f "${AP_SOFT_DIR}/ollama/bin/ollama" ]; then
            ln -sf "${AP_SOFT_DIR}/ollama/bin/ollama" "${AP_SOFT_DIR}/bin/ollama"
        fi
    fi

    apinitollama
    if alias apcreatedirstructollama &>/dev/null; then
        apcreatedirstructollama
    fi
}

alias aprmollama="ap_func_rm_ollama"
ap_func_rm_ollama() {
    aplogshow "Remove [ollama]\n"

    rm -f "${AP_SOFT_DIR}/bin/ollama"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/ollama"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/ollama"
    fi

    if alias aprmdirstructollama &>/dev/null; then
        aprmdirstructollama
    fi

    if alias aprmglobalsymlinkollama &>/dev/null; then
        aprmglobalsymlinkollama
    fi
}
