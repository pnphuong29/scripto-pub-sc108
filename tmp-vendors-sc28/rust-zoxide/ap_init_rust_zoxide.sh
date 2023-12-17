# https://github.com/ajeetdsouza/zoxide

export AP_VENDORS_ZOXIDE_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-zoxide"

# This env var must be declared before activating zoxide as on below codes
export _ZO_DATA_DIR="${AP_SCRIPTO_MAIN_DIR}/data/rust-zoxide/$(hostname)"
[[ ! -d "${_ZO_DATA_DIR}" ]] && mkdir -p "${_ZO_DATA_DIR}"

# When set to 1, z will print the matched directory before navigating to it.
export _ZO_ECHO=1

# Excludes the specified directories from the database.
# Separator using : in Linux, macOS and ; in Windows
# export _ZO_EXCLUDE_DIRS=""

# Custom options to pass to fzf during interactive selection. See man fzf for the list of options.
# export _ZO_FZF_OPTS=""

# Configures the aging algorithm, which limits the maximum number of entries in the database.
# By default, this is set to 10000.
# _ZO_MAXAGE=

# When set to 1, z will resolve symlinks before adding directories to the database.
# _ZO_RESOLVE_SYMLINKS=1

# Activate zoxide
eval "$(zoxide init bash)"
