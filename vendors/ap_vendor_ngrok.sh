alias @initngrok="ap_func_init_ngrok"
ap_func_init_ngrok() {
    if alias @initngrokshare &>/dev/null; then
        @initngrokshare
    fi

    if alias @initngrokcommon &>/dev/null; then
        @initngrokcommon
    fi
}

alias @createdirstructngrok="ap_func_create_dirstruct_ngrok"
ap_func_create_dirstruct_ngrok() {
    @logshow "Generate [ngrok] bash autocomplete\n"
    ngrok completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_ngrok.bash"

    if alias @createdirstructngrokshare &>/dev/null; then
        @createdirstructngrokshare
    fi

    if alias @createdirstructngrokcommon &>/dev/null; then
        @createdirstructngrokcommon
    fi
}

alias @rmdirstructngrok="ap_func_rm_dirstruct_ngrok"
ap_func_rm_dirstruct_ngrok() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_ngrok.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ngrok.bash"

    if alias @rmdirstructngrokshare &>/dev/null; then
        @rmdirstructngrokshare
    fi

    if alias @rmdirstructngrokcommon &>/dev/null; then
        @rmdirstructngrokcommon
    fi
}

alias @setupngrok="ap_func_setup_ngrok"
ap_func_setup_ngrok() {
    @logshow "Install [ngrok]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install ngrok/ngrok/ngrok
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc |
            sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" |
            sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
    fi

    @initngrok
    if alias @createdirstructngrok &>/dev/null; then
        @createdirstructngrok
    fi
}

alias @rmngrok="ap_func_rm_ngrok"
ap_func_rm_ngrok() {
    @logshow "Remove [ngrok]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove ngrok
        rm -rf "${HOME}/Library/Application Support/ngrok/ngrok.yml"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y ngrok
    fi

    if alias @rmdirstructngrok &>/dev/null; then
        @rmdirstructngrok
    fi

    if alias @rmglobalsymlinkngrok &>/dev/null; then
        @rmglobalsymlinkngrok
    fi
}
