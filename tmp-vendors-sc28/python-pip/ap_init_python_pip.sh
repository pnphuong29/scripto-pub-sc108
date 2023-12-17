# https://pip.pypa.io/en/stable/topics/configuration/
# Dependencies : python3

# Setting this to `os.devnull` disables the loading of all configuration files.
# When multiple configuration files are found, pip combines them in the following order:
# - PIP_CONFIG_FILE, if given.
# - Global
# - User
# - Site
# Each file read overrides any values read from previous files,
# so if the global timeout is specified in both the global file and
# the per-user file then the latter value will be used.
# export PIP_CONFIG_FILE=""

# Autocomplete
eval "$(pip completion --bash)"
eval "$(pip3 completion --bash)"
