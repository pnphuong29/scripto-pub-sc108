# PHP should be installed after installing
# - apache-httpd
# - mysql/mariadb
# - pgsql
# - redis
# - imagemagick

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    brew list --version | grep php &>/dev/null
    if [[ "$?" != 0 ]]; then
        @logshow "Installing [PHP] using [brew]\n"
        brew reinstall gd # Fix bugs "Library not loaded: /opt/homebrew/opt/libavif/lib/libavif.15.dylib"
        brew install php

        # @addpath "/usr/local/opt/php/bin"

        brew list --version | grep php &>/dev/null
        if [[ "$?" == 0 ]]; then
            @logshowpassed "[PHP] has been installed successfully using [brew]\n"
        else
            @logshowfailed "[PHP] has been installed unsuccessfully using [brew]\n"
        fi
    fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    if ! type php &>/dev/null; then
        @logshow "Installing [PHP] using [apt]\n"

        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:ondrej/php
        sudo apt update

        sudo apt install -y \
            php \
            php-dev \
            libapache2-mod-php \
            php-pear \
            php-curl \
            php-dompdf \
            php-gd \
            php-json \
            php-mbstring \
            php-xml \
            php-zip \
            php-sqlite3 \
            php-mysql \
            php-pgsql \
            php-bz2 \
            php-intl \
            php-ldap \
            php-smbclient \
            php-redis \
            php-imap \
            php-bcmath \
            php-gmp \
            php-apcu \
            php-memcached \
            php-imagick

        if type php &>/dev/null; then
            @logshowpassed "[PHP] has been installed successfully\n"
        else
            @logshowfailed "[PHP] has been installed unsuccessfully\n"
        fi
    fi
fi
