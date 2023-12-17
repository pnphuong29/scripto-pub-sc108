# https://flameshot.org/docs/guide/key-bindings/

export AP_VENDORS_FLAMESHOT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/flameshot"
export AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR="${AP_VENDORS_FLAMESHOT_SETUP_DIR}/configs"

alias viflameshotconfigs='vi -p \
	"${AP_VENDORS_FLAMESHOT_SETUP_DIR}/ap_init_flameshot.sh" \
	"${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_linux.ini" \
	"${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_macos.ini" \'
alias flameshotinitconfigs='flameshot config --filename img_%Y-%m-%d_%H-%M-%S; flameshot config --autostart true; flameshot config --trayicon true'

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	alias flameshotupdateconfigs='cp -f ~/.config/flameshot/flameshot.ini ~/.config/flameshot/flameshot.ini.bak; cp -f "${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_macos.ini" ~/.config/flameshot/flameshot.ini'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	alias flameshotupdateconfigs='cp -f ~/.config/flameshot/flameshot.ini ~/.config/flameshot/flameshot.ini.bak; cp -f "${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_linux.ini" ~/.config/flameshot/flameshot.ini'
	# alias flameshotupdateconfigs='cp -f ~/snap/flameshot/current/.config/flameshot/flameshot.ini ~/snap/flameshot/current/.config/flameshot/flameshot.ini.bak; cp -f "${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_linux.ini" ~/snap/flameshot/current/.config/flameshot/flameshot.ini'
fi

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	alias flameshotbkconfigs="cp -f ~/.config/flameshot/flameshot.ini ${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_macos.ini"
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	alias flameshotbkconfigs="cp -f ~/.config/flameshot/flameshot.ini ${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_linux.ini"
	# alias flameshotbkconfigs="cp -f ~/snap/flameshot/current/.config/flameshot/flameshot.ini ${AP_VENDORS_FLAMESHOT_SETUP_CONFIGS_DIR}/ap_flameshot_linux.ini"
fi
