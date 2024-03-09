alias apinitngrok="ap_func_init_ngrok"
ap_func_init_ngrok() {
    if alias apinitngrokshare &>/dev/null; then
        apinitngrokshare
    fi

    if alias apinitngrokcommon &>/dev/null; then
        apinitngrokcommon
    fi
}

alias apcreatedirstructngrok="ap_func_create_dirstruct_ngrok"
ap_func_create_dirstruct_ngrok() {
    aplogshow "Generate [ngrok] bash autocomplete\n"
    ngrok completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_ngrok.bash"

    if alias apcreatedirstructngrokshare &>/dev/null; then
        apcreatedirstructngrokshare
    fi

    if alias apcreatedirstructngrokcommon &>/dev/null; then
        apcreatedirstructngrokcommon
    fi
}

alias rmdirstructngrok="ap_func_rm_dirstruct_ngrok"
ap_func_rm_dirstruct_ngrok() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_ngrok.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ngrok.bash"

    if alias rmdirstructngrokshare &>/dev/null; then
        rmdirstructngrokshare
    fi

    if alias rmdirstructngrokcommon &>/dev/null; then
        rmdirstructngrokcommon
    fi
}

alias apsetupngrok="ap_func_setup_ngrok"
ap_func_setup_ngrok() {
    aplogshow "Install [ngrok]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install ngrok/ngrok/ngrok
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc |
            sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" |
            sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
    fi

    apinitngrok
    if alias apcreatedirstructngrok &>/dev/null; then
        apcreatedirstructngrok
    fi
}

alias rmngrok="ap_func_rm_ngrok"
ap_func_rm_ngrok() {
    aplogshow "Remove [ngrok]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove ngrok
        rm -rf "${HOME}/Library/Application Support/ngrok/ngrok.yml"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y ngrok
        rm -rf "${HOME}/.config/ngrok/ngrok.yml"
    fi

    if alias rmdirstructngrok &>/dev/null; then
        rmdirstructngrok
    fi

    if alias rmglobalsymlinkngrok &>/dev/null; then
        rmglobalsymlinkngrok
    fi
}

alias ngrokhttp='ap_func_ngrok_http'
alias ngrokhttplocal='ap_func_ngrok_http localhost'
ap_func_ngrok_http() {
    ngrok http "http://${1}:${2}"
}
