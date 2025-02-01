alias apinitcomposer="ap_func_init_composer"
ap_func_init_composer() {
    # https://getcomposer.org/doc/03-cli.md
    export COMPOSER_HOME="${HOME}/.composer"
    export COMPOSER_BIN_DIR="${COMPOSER_HOME}/vendor/bin"
    apaddpath "${COMPOSER_BIN_DIR}"

    alias zcomposer='cd "${HOME}/.composer"'
    alias zcomposerbin='cd "${HOME}/.composer/vendor/bin"'
    alias composerinstall='composer install'
    alias composerupdate='composer update'
    alias lscomposerconfigglobal='composer config --list --global'
    alias lscomposerconfig='composer config --list'

    if alias apinitcomposershare &>/dev/null; then
        apinitcomposershare
    fi

    if alias apinitcomposercommon &>/dev/null; then
        apinitcomposercommon
    fi
}

alias apcreatedirstructcomposer="ap_func_create_dirstruct_composer"
ap_func_create_dirstruct_composer() {
    aplogshow "Generate [PHP composer] bash autocomplete\n"
    symfony-autocomplete >"${AP_COMPLETIONS_DIR}/ap_completion_composer.bash"

    if alias apcreatedirstructcomposershare &>/dev/null; then
        apcreatedirstructcomposershare
    fi

    if alias apcreatedirstructcomposercommon &>/dev/null; then
        apcreatedirstructcomposercommon
    fi
}

alias aprmdirstructcomposer="ap_func_rm_dirstruct_composer"
ap_func_rm_dirstruct_composer() {
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_composer.bash"

    if alias aprmdirstructcomposershare &>/dev/null; then
        aprmdirstructcomposershare
    fi

    if alias aprmdirstructcomposercommon &>/dev/null; then
        aprmdirstructcomposercommon
    fi
}

alias apsetupcomposer="ap_func_setup_composer"
ap_func_setup_composer() {
    # https://getcomposer.org
    aplogshow "Install [PHP composer]\n"

    EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
        echo >&2 'ERROR: Invalid installer checksum'
        rm composer-setup.php
    fi

    rm -f "${AP_SOFT_DIR}/bin/composer"
    php composer-setup.php --quiet --install-dir="${AP_SOFT_DIR}/bin" --filename=composer
    rm composer-setup.php

    export COMPOSER_HOME="${HOME}/.composer"
    export COMPOSER_BIN_DIR="${COMPOSER_HOME}/vendor/bin"
    apaddpath "${COMPOSER_BIN_DIR}"

    # Autocomplete
    aplogshow "Installing [psysh, symfony-console-autocomplete]\n"
    composer global require \
        psy/psysh:@stable \
        bamarni/symfony-console-autocomplete \
        friendsofphp/php-cs-fixer

    apinitcomposer

    if alias apcreatedirstructcomposer &>/dev/null; then
        apcreatedirstructcomposer
    fi
}

alias aprmcomposer="ap_func_rm_composer"
ap_func_rm_composer() {
    aplogshow "Remove [PHP composer]\n"
    rm -f "${AP_SOFT_DIR}/bin/composer"
    rm -rf "${HOME}/.composer"

    if alias aprmdirstructcomposer &>/dev/null; then
        aprmdirstructcomposer
    fi

    if alias aprmglobalsymlinkcomposer &>/dev/null; then
        aprmglobalsymlinkcomposer
    fi
}
