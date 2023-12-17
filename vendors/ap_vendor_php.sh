# alias @initphp="ap_func_init_php"
# ap_func_init_php() {
#     @addpath "/usr/local/opt/php@8.3/bin"
# }

alias @setupphp="ap_func_setup_php"
ap_func_setup_php() {
    # PHP should be installed after installing
    # - apache-httpd
    # - mysql/mariadb
    # - pgsql
    # - redis
    # - imagemagick
    @logshow "Install [PHP 8.3]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew reinstall gd # Fix bugs "Library not loaded: /opt/homebrew/opt/libavif/lib/libavif.15.dylib"
        brew install php@8.3
        # @addpath "/usr/local/opt/php@8.3/bin"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:ondrej/php
        sudo apt update

        sudo apt install -y \
            php8.3 \
            libapache2-mod-php8.3

        sudo apt install -y \
            php8.3-dev \
            php-pear \
            php8.3-curl \
            php-dompdf \
            php8.3-gd \
            php-json \
            php8.3-mbstring \
            php8.3-xml \
            php8.3-zip \
            php8.3-sqlite3 \
            php8.3-mysql \
            php8.3-pgsql \
            php8.3-bz2 \
            php8.3-intl \
            php8.3-ldap \
            php8.3-smbclient \
            php8.3-redis \
            php8.3-imap \
            php8.3-bcmath \
            php8.3-gmp \
            php8.3-apcu \
            php8.3-memcached \
            php8.3-imagick
    fi
}

alias @rmphp="ap_func_remove_php"
ap_func_remove_php() {
    @logshow "Remove [php 8.3]\n"
    # MySQL should have only 1 version in current system
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall php@8.3
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove -y \
            php8.3 \
            libapache2-mod-php8.3

        sudo apt remove -y \
            php8.3-dev \
            php-pear \
            php8.3-curl \
            php-dompdf \
            php8.3-gd \
            php-json \
            php8.3-mbstring \
            php8.3-xml \
            php8.3-zip \
            php8.3-sqlite3 \
            php8.3-mysql \
            php8.3-pgsql \
            php8.3-bz2 \
            php8.3-intl \
            php8.3-ldap \
            php8.3-smbclient \
            php8.3-redis \
            php8.3-imap \
            php8.3-bcmath \
            php8.3-gmp \
            php8.3-apcu \
            php8.3-memcached \
            php8.3-imagick
    fi
}
