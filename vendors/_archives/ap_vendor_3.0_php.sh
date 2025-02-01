alias apinitphp="ap_func_init_php"
ap_func_init_php() {
    # apaddpath "/usr/local/opt/php@8.1/bin"
    alias zphp81fpm='cd /etc/php/8.1/fpm/'
    alias zphp81fpmpoold='cd /etc/php/8.1/fpm/pool.d'

    alias rrphpfpm81='sudo systemctl restart php8.1-fpm.service'
    alias ssphpfpm81='sudo systemctl status php8.1-fpm.service'

    if alias apinitphpshare &>/dev/null; then
        apinitphpshare
    fi

    if alias apinitphpcommon &>/dev/null; then
        apinitphpcommon
    fi
}

alias apcreatedirstructphp="ap_func_create_dirstruct_php"
ap_func_create_dirstruct_php() {
    if alias apcreatedirstructphpshare &>/dev/null; then
        apcreatedirstructphpshare
    fi

    if alias apcreatedirstructphpcommon &>/dev/null; then
        apcreatedirstructphpcommon
    fi
}

alias aprmdirstructphp="ap_func_rm_dirstruct_php"
ap_func_rm_dirstruct_php() {
    if alias aprmdirstructphpshare &>/dev/null; then
        aprmdirstructphpshare
    fi

    if alias aprmdirstructphpcommon &>/dev/null; then
        aprmdirstructphpcommon
    fi
}

alias apcreateglobalsymlinkphp81="ap_func_create_global_symlink_php"
ap_func_create_global_symlink_php() {
    if [ -f "/opt/local/bin/php-config81" ]; then
        aplogshow "Create symlink from [/usr/local/bin/php-config] to [/opt/local/bin/php-config81]\n"
        sudo ln -sf "/opt/local/bin/php-config81" "/usr/local/bin/php-config"
    fi

    if [ -f "/opt/local/bin/php81" ]; then
        aplogshow "Create symlink from [/usr/local/bin/php] to [/opt/local/bin/php81]\n"
        sudo ln -sf "/opt/local/bin/php81" "/usr/local/bin/php"
    fi

    if [ -f "/opt/local/bin/phpize81" ]; then
        aplogshow "Create symlink from [/usr/local/bin/phpize] to [/opt/local/bin/phpize81]\n"
        sudo ln -sf "/opt/local/bin/phpize81" "/usr/local/bin/phpize"
    fi
}

alias apsetupphp="ap_func_setup_php"
ap_func_setup_php() {
    # PHP should be installed after installing
    # - apache-http
    # - mysql/mariadb
    # - pgsql
    # - redis
    # - imagemagick
    aplogshow "Install [PHP 8.1]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew has problems with performance especially when running on macOS Catalina
        # brew reinstall gd # Fix bugs "Library not loaded: /opt/homebrew/opt/libavif/lib/libavif.15.dylib"
        # brew install php@8.1
        sudo port install \
            php81 \
            php81-fpm \
            php81-apache2handler \
            php81-curl \
            php81-gd \
            php81-openssl \
            php81-mbstring \
            php81-zip \
            php81-sqlite \
            php81-mysql \
            php81-postgresql \
            php81-intl \
            php81-iconv \
            php81-ldap \
            php81-redis \
            php81-imap \
            php81-gmp \
            php81-APCu \
            php81-memcached \
            php81-imagick
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

    apinitphp
    if alias apcreatedirstructphp &>/dev/null; then
        apcreatedirstructphp
    fi
}

alias aprmphp="ap_func_rm_php"
ap_func_rm_php() {
    aplogshow "Remove [PHP 8.1]\n"

    # MySQL should have only 1 version in current system
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew uninstall php@8.1
        sudo port uninstall \
            php81 \
            php81-fpm \
            php81-apache2handler \
            php81-curl \
            php81-gd \
            php81-mbstring \
            php81-zip \
            php81-sqlite \
            php81-mysql \
            php81-postgresql \
            php81-intl \
            php81-ldap \
            php81-redis \
            php81-imap \
            php81-gmp \
            php81-APCu \
            php81-memcached \
            php81-imagick
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

    if alias aprmdirstructphp &>/dev/null; then
        aprmdirstructphp
    fi

    if alias aprmglobalsymlinkphp &>/dev/null; then
        aprmglobalsymlinkphp
    fi
}

alias portloadphp81services="ap_func_port_load_php81_services"
ap_func_port_load_php81_services() {
    sudo port load apache2
    sudo port load php81-fpm
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
