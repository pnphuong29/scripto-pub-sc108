# MySQL should have only 1 version in current system

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep php &>/dev/null
	if [[ "$?" == 0 ]]; then
		@logshow "Removing [PHP] using [brew]\n"
		brew uninstall php

		if [[ ! -f "/usr/local/opt/php/bin" ]]; then
			@logshowpassed "[PHP] has been removed successfully\n"
		else
			@logshowfailed "[PHP] has been removed unsuccessfully\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type php &>/dev/null; then
		@logshow "Removing [PHP] using [apt]\n"

		sudo apt purge -y \
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

		sudo apt autoremove -y

		if ! type php &>/dev/null; then
			@logshowpassed "[PHP] has been removed successfully\n"
		else
			@logshowfailed "[PHP] has been removed unsuccessfully\n"
		fi
	fi
fi
