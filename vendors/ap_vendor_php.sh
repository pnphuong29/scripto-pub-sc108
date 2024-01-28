alias @initphp="ap_func_init_php"
ap_func_init_php() {
    # @addpath "/usr/local/opt/php@8.1/bin"

    if alias @initphpshare &>/dev/null; then
        @initphpshare
    fi

    if alias @initphpcommon &>/dev/null; then
        @initphpcommon
    fi
}

alias @createdirstructphp="ap_func_create_dirstruct_php"
ap_func_create_dirstruct_php() {
    if alias @createdirstructphpshare &>/dev/null; then
        @createdirstructphpshare
    fi

    if alias @createdirstructphpcommon &>/dev/null; then
        @createdirstructphpcommon
    fi
}

alias @rmdirstructphp="ap_func_rm_dirstruct_php"
ap_func_rm_dirstruct_php() {
    if alias @rmdirstructphpshare &>/dev/null; then
        @rmdirstructphpshare
    fi

    if alias @rmdirstructphpcommon &>/dev/null; then
        @rmdirstructphpcommon
    fi
}

alias @setupphp="ap_func_setup_php"
ap_func_setup_php() {
    # PHP should be installed after installing
    # - apache-http
    # - mysql/mariadb
    # - pgsql
    # - redis
    # - imagemagick
    @logshow "Install [PHP 8.1]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew reinstall gd # Fix bugs "Library not loaded: /opt/homebrew/opt/libavif/lib/libavif.15.dylib"
        brew install php@8.1
        # @addpath "/usr/local/opt/php@8.1/bin"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:ondrej/php
        sudo apt update

        sudo apt install -y \
            php8.1 \
            php8.1-fpm \
            libapache2-mod-php8.1

        sudo apt install -y \
            php8.1-dev \
            php-pear \
            php8.1-curl \
            php-dompdf \
            php8.1-gd \
            php-json \
            php8.1-mbstring \
            php8.1-xml \
            php8.1-zip \
            php8.1-sqlite3 \
            php8.1-mysql \
            php8.1-pgsql \
            php8.1-bz2 \
            php8.1-intl \
            php8.1-ldap \
            php8.1-smbclient \
            php8.1-redis \
            php8.1-imap \
            php8.1-bcmath \
            php8.1-gmp \
            php8.1-apcu \
            php8.1-memcached \
            php8.1-imagick
    fi

    @initphp
    if alias @createdirstructphp &>/dev/null; then
        @createdirstructphp
    fi
}

alias @rmphp="ap_func_rm_php"
ap_func_rm_php() {
    @logshow "Remove [PHP 8.1]\n"

    # MySQL should have only 1 version in current system
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall php@8.1
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y \
            php8.1 \
            php8.1-fpm \
            libapache2-mod-php8.1 \
            php8.1-dev \
            php-pear \
            php8.1-curl \
            php-dompdf \
            php8.1-gd \
            php-json \
            php8.1-mbstring \
            php8.1-xml \
            php8.1-zip \
            php8.1-sqlite3 \
            php8.1-mysql \
            php8.1-pgsql \
            php8.1-bz2 \
            php8.1-intl \
            php8.1-ldap \
            php8.1-smbclient \
            php8.1-redis \
            php8.1-imap \
            php8.1-bcmath \
            php8.1-gmp \
            php8.1-apcu \
            php8.1-memcached \
            php8.1-imagick

        sudo apt autoremove -y
    fi

    if alias @rmdirstructphp &>/dev/null; then
        @rmdirstructphp
    fi

    if alias @rmglobalsymlinkphp &>/dev/null; then
        @rmglobalsymlinkphp
    fi
}

alias php81updatesymlinks="ap_func_update_symlinks"
ap_func_update_symlinks() {
    sudo ln -sf /usr/bin/php8.1 /etc/alternatives/php
    sudo ln -sf /usr/share/man/man1/php8.1.1.gz /etc/alternatives/php.1.gz

    sudo ln -sf /usr/bin/php-config8.1 /usr/bin/php-config.default
    sudo ln -sf /usr/bin/php-config.default /etc/alternatives/php-config

    sudo ln -sf /usr/share/man/man1/php-config8.1.1.gz /usr/share/man/man1/php-config.default.1.gz

    sudo ln -sf /usr/bin/phpize8.1 /usr/bin/phpize.default

    sudo ln -sf /usr/share/man/man1/phpize8.1.1.gz /usr/share/man/man1/phpize.default.1.gz
}

alias php81updateconfigs="ap_func_php_fpm_update_config"
ap_func_php_fpm_update_config() {
    local ap_php_fpm_config_dir="${HOME}/scripto-common/vendors/php/php-fpm.d"
    if [ -d "${HOME}/scripto-main/vendors/php/php-fpm.d" ]; then
        ap_php_fpm_config_dir="${HOME}/scripto-main/vendors/php/php-fpm.d"
    fi

    # sudo cp -f "${HOME}/scripto-share/vendors/php/php-fpm.d"/*.conf /etc/php/8.1/fpm/pool.d/
    sudo cp -f "${ap_php_fpm_config_dir}"/*.conf /etc/php/8.1/fpm/pool.d/
}
