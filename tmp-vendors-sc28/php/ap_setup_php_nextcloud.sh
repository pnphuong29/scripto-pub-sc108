# PHP should be installed after installing
# - apache-httpd
# - mysql/mariadb
# - pgsql
# - redis
# - imagemagick

if ! type php &>/dev/null; then
	@logshow "Installing [PHP 8.1] using [apt]\n"

	sudo apt install -y software-properties-common
	sudo add-apt-repository -y ppa:ondrej/php
	sudo apt update

	sudo apt install -y \
		php8.1 \
		php8.1-dev \
		libapache2-mod-php8.1

	sudo apt install -y \
		php8.1-curl \
		php8.1-gd \
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

	# sudo apt install -y \
	# 	php-pear \
	# 	php-json \
	# 	php-dompdf

	if type php &>/dev/null; then
		@logshowpassed "[PHP] has been installed successfully\n"
	else
		@logshowfailed "[PHP] has been installed unsuccessfully\n"
	fi
fi
