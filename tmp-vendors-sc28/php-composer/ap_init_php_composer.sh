# https://getcomposer.org/doc/03-cli.md

export COMPOSER_HOME="${HOME}/.composer"
export COMPOSER_BIN_DIR="${COMPOSER_HOME}/vendor/bin"
@addpath "${COMPOSER_BIN_DIR}"
eval "$(symfony-autocomplete)" # Autocomplete
