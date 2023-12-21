alias @initphp="ap_func_init_php"
ap_func_init_php() {
    # @addpath "/usr/local/opt/php@8.1/bin"
    if alias @initphpcommon &>/dev/null; then
        @initphpcommon
    fi
}

alias @createdirstructphp="ap_func_create_dirstruct_php"
ap_func_create_dirstruct_php() {
    if alias @createdirstructphpcommon &>/dev/null; then
        @createdirstructphpcommon
    fi
}

alias @rmdirstructphp="ap_func_remove_dirstruct_php"
ap_func_remove_dirstruct_php() {
    if alias @rmdirstructphpcommon &>/dev/null; then
        @rmdirstructphpcommon
    fi
}

alias @setupphp="ap_func_setup_php"
ap_func_setup_php() {
    # PHP should be installed after installing
    # - apache-httpd
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
}

alias @rmphp="ap_func_remove_php"
ap_func_remove_php() {
    @logshow "Remove [php 8.1]\n"
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
}
