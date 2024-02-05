alias showostype='ap_func_get_os_type'
# @$func $$ ap_func_get_os_type {
# ap_func_get_os_type
# Descriptions
# 	Get current OS type
# Return
# 	OS type [AP_OS_TYPE_MACOS, AP_OS_TYPE_UBUNTU, etc.]
# Return Status
# 	0: Success
# }
ap_func_get_os_type() {
    local ap_os_type=''

    if [ "$(uname)" == 'Darwin' ]; then
        ap_os_type="${AP_OS_TYPE_MACOS}"
    elif [ "$(uname)" == 'Linux' ] && [ "$(grep ^ID= /etc/os-release | cut -d = -f 2)" == 'ubuntu' ]; then
        ap_os_type="${AP_OS_TYPE_UBUNTU}"
    else
        ap_os_type="${AP_OS_TYPE_UNKNOWN}"
    fi

    printf "%s" "${ap_os_type}"
    @rtn_success
}

alias trim='ap_func_trim'
alias trimfile='ap_func_trim -f --'
# @$func $$ ap_func_trim {
# ap_func_trim [-f] [--] [input_text/input_file]
# Description
# 	Trim heading and trailing whitespace of [input_text] or [input_file]
# Options
# 	-f Input file
# Parameters
# 	[input_text]	Text to perform trimming
# Return
# 	Trimmed text
# Return Status
#	AP_CODE_SUCCESS
# }
ap_func_trim() {
    local ap_opts_string='f:'
    local ap_opt=''
    local ap_opt_input_file=''

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'f')
            ap_opt_input_file="${OPTARG}"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    if [ -z "${ap_opt_input_file}" ]; then
        local ap_text="${1:-}"
        [ -z "${ap_text}" ] && @rtn_success

        # trim heading spaces
        ap_text="$(printf "%s" "${ap_text}" | gsed -E 's/^ +//')"

        # trim trailing spaces
        ap_text="$(printf "%s" "${ap_text}" | gsed -E 's/ +$//')"

        # return text
        printf "%s" "${ap_text}"
    else
        if [ -f "${ap_opt_input_file}" ]; then
            # trim heading spaces
            gsed -E 's/^ +//' "${ap_opt_input_file}"

            # trim trailing spaces
            gsed -E 's/ +$//' "${ap_opt_input_file}"
        fi
    fi

    @rtn_success
}

alias democolorsandformatting='ap_func_demo_colors_and_formatting'
alias democolorsandformatting256='ap_func_demo_colors_and_formatting 256'
# @$func $$ ap_func_demo_colors_and_formatting {
# ap_func_demo_colors_and_formatting [--] [no_of_bits]
# Description
# 	https://misc.flogisoft.com/bash/tip_colors_and_formatting
#
# 	This program is free software. It comes without any warranty, to
# 	the extent permitted by applicable law. You can redistribute it
# 	and/or modify it under the terms of the Do What The Fuck You Want
# 	To Public License, Version 2, as published by Sam Hocevar. See
# 	http://sam.zoy.org/wtfpl/COPYING for more details.
#
# 	Make a demo of show colors and formatting texts in the terminal
# Params
# 	[no_of_bits]: Could be [8] or [256] (Default: [8])
#	Return status
#		0: Successful
#		1: Failed
# }
ap_func_demo_colors_and_formatting() {
    local ap_param_no_of_bits='8'

    if [ -n "${1:-}" ]; then
        ap_param_no_of_bits='256'
    fi

    case "${ap_param_no_of_bits}" in
    '8')
        # Background
        for clbg in {40..47} {100..107} 49; do
            # Foreground
            for clfg in {30..37} {90..97} 39; do
                # Formatting
                for attr in 0 1 2 4 5 7; do
                    echo -en "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
                done

                echo
            done
        done
        ;;

    '256')
        for fgbg in 38 48; do         # Foreground / Background
            for color in {0..255}; do # Colors
                # Display the color
                printf "\e[${fgbg};5;%sm  %3s  \e[0m" "${color}" "${color}"
                # Display 6 colors per lines
                if [ $(((color + 1) % 6)) -eq 4 ]; then
                    echo
                fi
            done

            echo
        done
        ;;
    *)
        echo "Invalid option"
        return 1
        ;;
    esac

    return 0
}

alias vidir="ap_func_vim_open_all_files_in_current_dir"
# @$func $$ ap_func_vim_open_all_files_in_current_dir {
# ap_func_vim_open_all_files_in_current_dir
# Description
# 	Open all files in current directory
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_vim_open_all_files_in_current_dir() {
    local ap_file
    local ap_cmd='vi -p'

    shopt -s dotglob # Enable listing dot files when globbing
    for ap_file in "${PWD}"/*; do
        ap_cmd="${ap_cmd} \"${ap_file}\""
    done
    shopt -u dotglob # Disable listing dot files when globbing

    if [[ "${ap_cmd}" != "vi -p" ]]; then
        eval "${ap_cmd}"
    fi

    @rtn_success
}

alias @chmod="ap_func_chmod"
alias chmod777666="ap_func_chmod 777 666"
alias chmoddir="ap_func_chmod -d -r"
alias chmoddir777="ap_func_chmod -d -r 777"
alias chmodfile="ap_func_chmod -f -r"
alias chmodfile666="ap_func_chmod -f -r 666"
# @$func $$ ap_func_chmod {
# ap_func_chmod <dir_mod> <file_mod> <path>
# Description
# 	Perform chmod for files and folders in <path> with respective input permissions
# Options
#   -r Use sudo permissions
# 	-d Perform chmod for directories only
# 	-f Perform chmod for files only
# Parameters
# 	<path> Path to search
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_chmod() {
    local ap_opts_string=':dfr'
    local ap_opt=''
    local ap_opt_d=0
    local ap_opt_f=0
    local ap_opt_r=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'd')
            ap_opt_d=1
            ;;
        'f')
            ap_opt_f=1
            ;;
        'r')
            ap_opt_r=1
            ;;
        ?)
            @merr "Invalid option [${OPTARG}]"
            reterr_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_default_dir_mod="750"
    local ap_default_file_mod="640"
    local ap_default_path="${PWD}"

    if [[ $ap_opt_d = 1 && $ap_opt_f = 1 ]]; then
        @merr "Cannot have both options [d] and [f] at the same time!\n"
        @reterr_unknown
    fi

    if [[ $ap_opt_d = 1 ]]; then
        local ap_dir_mod="${1:-${ap_default_dir_mod}}"
        local ap_path="${2:-${ap_default_path}}"

        if [[ "${ap_opt_r}" == 1 ]]; then
            find "${ap_path}" -type d -exec sudo chmod "${ap_dir_mod}" {} \;
        else
            find "${ap_path}" -type d -exec chmod "${ap_dir_mod}" {} \;
        fi

        @rtn_success
    fi

    if [[ $ap_opt_f = 1 ]]; then
        local ap_file_mod="${1:-${ap_default_file_mod}}"
        local ap_path="${2:-${ap_default_path}}"

        if [[ "${ap_opt_r}" == 1 ]]; then
            find "${ap_path}" -type f -exec sudo chmod "${ap_file_mod}" {} \;
        else
            find "${ap_path}" -type f -exec chmod "${ap_file_mod}" {} \;
        fi

        @rtn_success
    fi

    local ap_dir_mod="${1:-${ap_default_dir_mod}}"
    local ap_file_mod="${2:-${ap_default_file_mod}}"
    local ap_path="${3:-${ap_default_path}}"

    if [[ "${ap_opt_r}" == 1 ]]; then
        find "${ap_path}" -type d -exec sudo chmod "${ap_dir_mod}" {} \;
        find "${ap_path}" -type f -exec sudo chmod "${ap_file_mod}" {} \;
    else
        find "${ap_path}" -type d -exec chmod "${ap_dir_mod}" {} \;
        find "${ap_path}" -type f -exec chmod "${ap_file_mod}" {} \;
    fi

    @rtn_success
}

alias @rsync="ap_func_rsync"
# @$func $$ ap_func_rsync {
# ap_func_rsync [-dpuwr] <domain/ip> <port> <user> <password> [--] *<src_path> <dst_path>
# Description
# 	Rsync a file or folder to a remote machine
# Notes
#	Rsync folder must have correct owner and permissions to for this function to work correctly
# Options
# 	-d <domain/ip>	Specify a domain or an IP address to rsync to
#   -u <user>       Specify user
#	-p <port>		Specify port number
#	-w <pass>		User's password
#	-r 		        Recursive rsync directories
# Parameters
# 	*<src_path>	Path to the file or folder of current machine (source)
# 	<dst_path>	Path to the folder of the remote machine (destination) (default: `AP_RSYNC_DIR` )
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_rsync() {
    local ap_opts_string=':d:p:u:w:r'
    local ap_opt=''
    local ap_opt_r=0
    local ap_domain_ip=""
    local ap_port=""
    local ap_rsync_user=""
    local ap_rsync_pass=""

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'r')
            ap_opt_r=1
            ;;
        'd')
            ap_domain_ip="${OPTARG}"
            ;;
        'p')
            ap_port="${OPTARG}"
            ;;
        'u')
            ap_rsync_user="${OPTARG}"
            ;;
        'w')
            ap_rsync_pass="${OPTARG}"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_src_path="${1:"${PWD}"}"
    local ap_dst_path="${2:/tmp/}"

    @minfo "Sync from [${ap_src_path}] to [${ap_rsync_user}@${ap_domain_ip}:${ap_dst_path}] via port [${ap_port}]\n"
    if [ -n "${ap_rsync_pass}" ]; then
        sshpass -p "${ap_rsync_pass}" rsync -avP -e "ssh -p ${ap_port}" "${ap_src_path}" "${ap_rsync_user}@${ap_domain_ip}:${ap_dst_path}"
    else
        if [[ "${ap_opt_r}" == 1 ]]; then
            rsync -avrzP -e "ssh -p ${ap_port}" "${ap_src_path}" "${ap_rsync_user}@${ap_domain_ip}:${ap_dst_path}"
        else
            rsync -avzP -e "ssh -p ${ap_port}" "${ap_src_path}" "${ap_rsync_user}@${ap_domain_ip}:${ap_dst_path}"
        fi
    fi

    @rtn_success
}
