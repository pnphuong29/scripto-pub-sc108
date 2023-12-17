# https://github.com/ranger/ranger/wiki/Official-user-guide

export AP_VENDORS_PYTHON_RANGER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/python-ranger"
export AP_VENDORS_PYTHON_RANGER_SETUP_CONFIGS_DIR="${AP_VENDORS_PYTHON_RANGER_SETUP_DIR}/configs"

alias virangerconfigs="vi ${AP_VENDORS_PYTHON_RANGER_SETUP_CONFIGS_DIR}/rc.conf"
alias virangerconfigsext="vi ${AP_VENDORS_PYTHON_RANGER_SETUP_CONFIGS_DIR}/rifle.conf"

# If you want to keep the full rc.conf though, you may want to set the environment variable RANGER_LOAD_DEFAULT_RC to FALSE
# to avoid loading both the default and your own rc.conf. In this case you have to update your config manually though.
# export RANGER_LOAD_DEFAULT_RC=FALSE
export RANGER_LOAD_DEFAULT_RC=TRUE

# Copy latest version of the original config files for references
# and copy config files to appropriate locations for ranger to read
alias rangerresetconfigs="rm -f ~/.config/ranger/rc.conf; ranger --copy-config=rc &>/dev/null; cp -f ~/.config/ranger/rc.conf ${AP_VENDORS_PYTHON_RANGER_SETUP_CONFIGS_DIR}/rc.origin.conf"

ln -sf "${AP_VENDORS_PYTHON_RANGER_SETUP_CONFIGS_DIR}/rc.conf" ~/.config/ranger/rc.conf

# echo >>~/.config/ranger/rc.conf
# echo "${AP_MARKER_START}" >>~/.config/ranger/rc.conf
# cat "${AP_VENDORS_PYTHON_RANGER_SETUP_CONFIGS_DIR}/rc.conf" >>~/.config/ranger/rc.conf
# echo "${AP_MARKER_END}" >>~/.config/ranger/rc.conf

ln -sf "${AP_VENDORS_PYTHON_RANGER_SETUP_CONFIGS_DIR}/rifle.conf" ~/.config/ranger/rifle.conf

# bind Ctrl + <Space> as the shortcut key to ranger command
# bind -x '"\C- ":"ranger"'

# rm -f ~/.config/ranger/scope.sh
# ranger --copy-config=scope &>/dev/null

# rm -f ~/.config/ranger/commands.py
# ranger --copy-config=commands &>/dev/null

# Ranger shell prompt indicator
# if [[ -n "${RANGER_LEVEL}" ]]; then
# 	export PS1="[ranger]${PS1}"
# fi
