# https://getcomposer.org

if ! type composer &>/dev/null; then
	@logshow "Installing [composer]\n"

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
	@addpath "${COMPOSER_BIN_DIR}"

	if type composer &>/dev/null; then
		@logshowpassed "[composer] has been installed successfully\n"
	else
		@logshowfailed "[composer] has been installed unsuccessfully\n"
	fi

	# Autocomplete
	@logshow "Installing [symfony-console-autocomplete]\n"
	composer global require bamarni/symfony-console-autocomplete

	if type symfony-autocomplete &>/dev/null; then
		@logshowpassed "[symfony-console-autocomplete] has been installed successfully\n"
	else
		@logshowfailed "[symfony-console-autocomplete] has been installed unsuccessfully\n"
	fi

fi
