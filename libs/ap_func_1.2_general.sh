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
