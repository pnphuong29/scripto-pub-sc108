alias @initcertbot="ap_func_init_certbot"
ap_func_init_certbot() {
    if alias @initcertbotcommon &>/dev/null; then
        @initcertbotcommon
    fi
}

alias @createdirstructcertbot="ap_func_create_dirstruct_certbot"
ap_func_create_dirstruct_certbot() {
    @logshow "Generate [certbot] bash autocomplete\n"
    certbot >"${AP_COMPLETIONS_DIR}/ap_completion_certbot.bash"

    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/certbot] to [${AP_SOFT_DIR}/certbot/bin/certbot]\n"
    ln -sf "${AP_SOFT_DIR}/certbot/bin/certbot" "${AP_SOFT_DIR}/bin/certbot"

    @logshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_certbot.bash] to [${AP_SOFT_DIR}/certbot/complete/certbot.bash]\n"
    ln -sf "${AP_SOFT_DIR}/certbot/autocomplete/certbot.bash" "${AP_COMPLETIONS_DIR}/ap_completion_certbot.bash"

    @logshow "Create symlink from [${AP_MAN_DIR}/man1/certbot.1] to [${AP_SOFT_DIR}/certbot/certbot.1]\n"
    ln -sf "${AP_SOFT_DIR}/certbot/certbot.1" "${AP_MAN_DIR}/man1/certbot.1"

    if alias @createdirstructcertbotcommon &>/dev/null; then
        @createdirstructcertbotcommon
    fi
}

alias @rmdirstructcertbot="ap_func_remove_dirstruct_certbot"
ap_func_remove_dirstruct_certbot() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/certbot]\n"
    rm -f "${AP_SOFT_DIR}/bin/certbot"

    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_certbot.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_certbot.bash"

    @logshow "Remove [${AP_MAN_DIR}/man1/certbot.1]\n"
    rm -f "${AP_MAN_DIR}/man1/certbot.1"

    if alias @rmdirstructcertbotcommon &>/dev/null; then
        @rmdirstructcertbotcommon
    fi
}

alias @createglobalsymlinkcertbot="ap_func_create_global_symlink_certbot"
ap_func_create_global_symlink_certbot() {
    if [ -f "/usr/bin/certbot" ]; then
        @logshow "Create symlink from [/snap/bin/certbot] to [/usr/bin/certbot]\n"
        sudo ln -sf "/snap/bin/certbot" "/usr/bin/certbot"
    fi
}

alias @rmglobalsymlinkcertbot="ap_func_remove_global_symlink_certbot"
ap_func_remove_global_symlink_certbot() {
    if [ -f "/usr/bin/certbot" ]; then
        @logshow "Remove [/usr/bin/certbot]\n"
        sudo rm -f "/usr/bin/certbot"
    fi
}

alias @setupcertbot="ap_func_setup_certbot"
ap_func_setup_certbot() {
    # https://eff-certbot.readthedocs.io/en/stable/install.html
    # https://certbot.eff.org/instructions?ws=apache&os=ubuntufocal

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        @logshow "Install [certbot]\n"
        sudo snap install core
        sudo snap refresh core
        sudo apt purge -y certbot
        sudo snap install --classic certbot
    fi

    if alias @createdirstructcertbot &>/dev/null; then
        @createdirstructcertbot
    fi

    if alias @createglobalsymlinkcertbot &>/dev/null; then
        @createglobalsymlinkcertbot
    fi
}

alias @rmcertbot="ap_func_remove_certbot"
ap_func_remove_certbot() {
    @logshow "Remove [certbot]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge certbot
        sudo rm -f /usr/bin/certbot
        sudo rm -f /bin/certbot
    fi

    if alias @rmdirstructcertbot &>/dev/null; then
        @rmdirstructcertbot
    fi

    if alias @rmglobalsymlinkcertbot &>/dev/null; then
        @rmglobalsymlinkcertbot
    fi
}
