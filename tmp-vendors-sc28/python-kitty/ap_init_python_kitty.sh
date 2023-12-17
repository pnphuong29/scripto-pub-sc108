# https://sw.kovidgoyal.net/kitty/binary/
# Dependencies: ghq

export AP_VENDORS_PYTHON_KITTY_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/python-kitty"
export AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR="${AP_VENDORS_PYTHON_KITTY_SETUP_DIR}/configs"
export AP_VENDORS_PYTHON_KITTY_REPO_URL="https://github.com/kovidgoyal/kitty"
export AP_VENDORS_PYTHON_KITTY_GH_DIR="${AP_GH_DIR}/kovidgoyal/kitty"
export AP_VENDORS_PYTHON_KITTY_THEMES_REPO_URL="https://github.com/dexpota/kitty-themes"
export AP_VENDORS_PYTHON_KITTY_THEMES_GH_DIR="${AP_GH_DIR}/dexpota/kitty-themes"

# export AP_KITTY_THEME='MaterialDark'
export AP_KITTY_THEME='Monokai_Pro'
export AP_KITTY_THEME='Monokai_Pro_(Filter_Octagon)'
# export AP_KITTY_THEME='Monokai_Pro_(Filter_Spectrum)'
# export AP_KITTY_THEME='Monokai_Soda'
# export AP_KITTY_THEME='Spring'
# export AP_KITTY_THEME='WildCherry'

# export KITTY_CONFIG_DIRECTORY="${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}"
# ln -sf "${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty.conf" ~/.config/kitty/kitty.conf
# ln -sf "${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/themes/themes/${AP_KITTY_THEME}.conf" "${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_themes.conf"
ln -sf "${AP_VENDORS_PYTHON_KITTY_THEMES_GH_DIR}/themes/${AP_KITTY_THEME}.conf" "${HOME}/.config/kitty/kitty_themes.conf"
ln -sf "${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_open_actions.conf" "${HOME}/.config/kitty/open-actions.conf"
ln -sf "${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_launch_actions.conf" "${HOME}/.config/kitty/launch-actions.conf"

alias zsckittyconfigs="cd ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}"
alias zkittyconfigs='cd ~/.config/kitty/'
alias zkittythemes='cd "${AP_VENDORS_PYTHON_KITTY_THEMES_GH_DIR}/themes/"'

# alias kittyinstallthemes='git clone --depth 1 https://github.com/dexpota/kitty-themes.git "${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/themes"'
alias kittyinstallthemes='ghq get "${AP_VENDORS_PYTHON_KITTY_THEMES_REPO_URL}"'
alias visckittyconfigs="vi -p \
	${AP_VENDORS_PYTHON_KITTY_SETUP_DIR}/ap_init_python_kitty.sh \
	${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty.conf \
	${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_macos.conf \
	${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_launch_actions.conf \
	${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_open_actions.conf \
	~/.config/kitty/kitty.conf"

alias kittygeneratedefaultconfigs='kitty +edit-config'
alias rmkittyconfigs='rm -f ~/.config/kitty/kitty.conf'
alias bkkittyconfigs="cp -f ~/.config/kitty/kitty.conf ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/origin/kitty.conf"
# alias kittyupdateconfigs="cp -f ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty.conf ~/.config/kitty/kitty.conf"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    alias kittyincludeconfigs='\
		echo "include ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty.conf" >> ~/.config/kitty/kitty.conf; \
		echo "include ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_macos.conf" >> ~/.config/kitty/kitty.conf; \
		echo "include ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_launcher.conf" >> ~/.config/kitty/kitty.conf; \
		echo "include ${HOME}/.config/kitty/kitty_themes.conf" >> ~/.config/kitty/kitty.conf'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    alias kittyincludeconfigs='\
		echo "include ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty.conf" >> ~/.config/kitty/kitty.conf; \
		echo "include ${AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR}/ap_kitty_launcher.conf" >> ~/.config/kitty/kitty.conf; \
		echo "include ${HOME}/.config/kitty/kitty_themes.conf" >> ~/.config/kitty/kitty.conf'
fi

# @$alias $$ ap_func_kitty_send_text {
alias ap_alias_kitty_send_text='ap_func_kitty_send_text'
alias @cmd='ap_func_kitty_send_text'
alias @cmdw='ap_func_kitty_send_text -w'
alias @cmdt='ap_func_kitty_send_text -t'
alias @cmda='ap_func_kitty_send_text -a'
# }

# @$func $$ ap_func_kitty_send_text [-atw] [--] <text> {
# ap_func_kitty_send_text
# Description
# 	Execute kitty @send-text command to specified tabs/windows
# Options
# 	-a: 		Send text to all kitty & os windows
# 	-t: 		Create new tab then send_text
# 	-w: 		Create new kitty window then send_text
# Parameters
# 	<text>:		Text to send
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_kitty_send_text() {
    local ap_opts_string='at'
    local ap_opt=''
    local ap_opt_a=0
    local ap_opt_t=0
    local ap_opt_w=0
    local ap_text=""

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'a')
            ap_opt_a=1
            ;;
        't')
            ap_opt_t=1
            ;;
        'w')
            ap_opt_t=1
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    if [[ "${ap_opt_w}" = 1 ]]; then
        local ap_kitty_window_id
        ap_kitty_window_id=$(kitty @launch --type window)
        kitty @send-text --match id:${ap_kitty_window_id} "${@}\n"
    elif [[ "${ap_opt_t}" = 1 ]]; then
        local ap_tab_id
        ap_tab_id=$(kitty @launch --type tab)
        kitty @send-text --match-tab id:${ap_tab_id} "${@}\n"
    elif [[ "${ap_opt_a}" = 1 ]]; then
        kitty @send-text --match all "${@}\n"
    else
        kitty @send-text --match-tab recent:0 "${@}\n"
    fi

    @rtn_success
}

# @$alias $$ ap_func_kitty_launch {
alias ap_alias_kitty_launch="ap_func_kitty_launch"
alias kittylaunchf="ap_func_kitty_launch"
# }

# @$func $$ ap_func_kitty_launch {
# ap_func_kitty_launch [-s] <style> [--] <prj>
# Description
#	Execute custom commands for projects
# Options
# 	-s 	Start server
# Parameters
# 	<style>	Created tabs/windows style
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_kitty_launch() {
    local ap_opts_string=":s:"
    local ap_opt=""
    local ap_opt_s=0
    local ap_style="pc7"

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "s")
            ap_opt_s=1
            ap_style="${OPTARG}"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @reterr_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    if [ ${ap_opt_s} == 1 ]; then
        local ap_tab_id
        local ap_win_id
        local ap_prj_code="$1"

        echo "Execute kitty launch for project [${ap_prj_code}] with style [${ap_style}]"
        # eval $(echo "pipenv${ap_prj_code}")

        case "${ap_style}" in
        "pc7")
            ap_tab_id=$(kitty @launch --type tab)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            kitty @send-text --match-tab id:${ap_tab_id} "z${ap_prj_code};\n"

            ap_tab_id=$(kitty @launch --type tab)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            kitty @send-text --match-tab id:${ap_tab_id} "pgcli${ap_prj_code}dev\n"

            # ap_tab_id=$(kitty @launch --type tab)
            # sleep 4
            # kitty @focus-tab --match id:${ap_tab_id}
            # kitty @send-text --match-tab id:${ap_tab_id} "start${ap_prj_code}devdgoserver\n"

            ap_tab_id=$(kitty @launch --type tab)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            kitty @send-text --match-tab id:${ap_tab_id} "dgoshell${ap_prj_code}\n"

            # ap_win_id=$(kitty @launch --type window)
            ap_tab_id=$(kitty @launch --type tab)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            # kitty @send-text --match id:${ap_win_id} "z${ap_prj_code}; npm run watch\n"
            kitty @send-text --match-tab id:${ap_tab_id} "z${ap_prj_code}; npm run watch\n"

            ap_win_id=$(kitty @launch --type window)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            kitty @send-text --match id:${ap_win_id} "start${ap_prj_code}devlivereloadserver\n"
            ;;
        "mac")
            ap_tab_id=$(kitty @launch --type tab)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            kitty @send-text --match-tab id:${ap_tab_id} "dgoshell${ap_prj_code}\n"

            ap_win_id=$(kitty @launch --type window)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            kitty @send-text --match id:${ap_win_id} "z${ap_prj_code}; npm run watch\n"

            ap_win_id=$(kitty @launch --type window)
            sleep 4
            kitty @focus-tab --match id:${ap_tab_id}
            kitty @send-text --match id:${ap_win_id} "start${ap_prj_code}devlivereloadserver\n"
            ;;
        ?)
            echo "Invalid style option [${OPTARG}]"
            @reterr_opt_invalid_option
            ;;
        esac
    fi

    @retsuccess
}
