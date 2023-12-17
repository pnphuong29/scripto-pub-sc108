# Defines the directory under which Python versions and shims reside.
# pyenv root
export PYENV_ROOT="${HOME}/.pyenv"
export AP_PYTHON_VERSION_DEFAULT="3.10.0"

# Sets a shell-specific Python version.
# This version overrides application-specific versions and the global version.
# pyenv shell
# export PYENV_VERSION="3.10.0"

# Outputs debug information.
# Also as: pyenv --debug <subcommand>
# export PYENV_DEBUG=1

# Colon-separated list of paths searched for pyenv hooks.
# export PYENV_HOOK_PATH=""

# Directory to start searching for .python-version files.
# Default to $PWD
# export PYENV_DIR=""

# prompt changing will be removed from future release | configure `export PYENV_VIRTUALENV_DISABLE_PROMPT=1' to simulate the behavior
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Activate python
@addpath "${PYENV_ROOT}/bin"
# eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
	source "${PYENV_ROOT}/completions/pyenv.bash"
fi

alias viscpyenv="vi -p ${AP_SCRIPTO_COMMON_DIR}/vendors/python-pyenv/ap_init_python_pyenv.sh"
alias unsetpyenvversion="unset PYENV_VERSION"
alias pyenvinitvirtualenv="\
	pyenv virtualenv ${AP_PYTHON_VERSION_DEFAULT} home; \
	pyenv virtualenv ${AP_PYTHON_VERSION_DEFAULT} test; \
	pyenv virtualenv ${AP_PYTHON_VERSION_DEFAULT} dev7; \
	pyenv virtualenv ${AP_PYTHON_VERSION_DEFAULT} lib1; \
	pyenv virtualenv ${AP_PYTHON_VERSION_DEFAULT} int1; \
	pyenv virtualenv ${AP_PYTHON_VERSION_DEFAULT} kv1; \
	pyenv virtualenv ${AP_PYTHON_VERSION_DEFAULT} ghn1; \
	"
