# https://pypa.github.io/pipx/docs/
# Dependencies: python3, pip3

# Overrides default pipx location.
# Virtual Environments will be installed to $PIPX_HOME/venvs.
# export PIPX_HOME=""

# Overrides location of app installations.
# Apps are symlinked or copied here.
# export PIPX_BIN_DIR=""

# Overrides default python used for commands.
# export PIPX_DEFAULT_PYTHON=""

# Autocomplete
eval "$(register-python-argcomplete pipx)"
