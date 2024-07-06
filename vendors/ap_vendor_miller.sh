alias apinitmiller="ap_func_init_miller"
ap_func_init_miller() {
    alias miller="mlr --tsv --opprint --barred put ''"

    if alias apinitmillershare &>/dev/null; then
        apinitmillershare
    fi

    if alias apinitmillercommon &>/dev/null; then
        apinitmillercommon
    fi

    if alias apinitmillermain &>/dev/null; then
        apinitmillermain
    fi
}

alias apcreatedirstructmiller="ap_func_create_dirstruct_miller"
ap_func_create_dirstruct_miller() {
    if alias apcreatedirstructmillershare &>/dev/null; then
        apcreatedirstructmillershare
    fi

    if alias apcreatedirstructmillercommon &>/dev/null; then
        apcreatedirstructmillercommon
    fi

    if alias apcreatedirstructmillermain &>/dev/null; then
        apcreatedirstructmillermain
    fi
}

alias aprmdirstructmiller="ap_func_rm_dirstruct_miller"
ap_func_rm_dirstruct_miller() {
    if alias aprmdirstructmillershare &>/dev/null; then
        aprmdirstructmillershare
    fi

    if alias aprmdirstructmillercommon &>/dev/null; then
        aprmdirstructmillercommon
    fi

    if alias aprmdirstructmillermain &>/dev/null; then
        aprmdirstructmillermain
    fi
}

alias apsetupmiller="ap_func_setup_miller"
ap_func_setup_miller() {
    aplogshow "Install [miller]\n"

    ghq get https://github.com/johnkerl/miller
    # mkdir -p "${HOME}/scripto-data/projects/github.com/johnkerl"
    # cd "${HOME}/scripto-data/projects/github.com/johnkerl"
    # git clone https://github.com/johnkerl/miller

    cd "${HOME}/scripto-data/projects/github.com/johnkerl/miller"
    go build github.com/johnkerl/miller/cmd/mlr
    go install github.com/johnkerl/miller/cmd/mlr

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew install miller
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt-get install -y miller
    # fi

    apinitmiller
    if alias apcreatedirstructmiller &>/dev/null; then
        apcreatedirstructmiller
    fi
}

alias aprmmiller="ap_func_rm_miller"
ap_func_rm_miller() {
    aplogshow "Remove [miller]\n"
    rm -f "$(go env GOPATH)/bin/mlr"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew remove miller
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt-get purge -y miller
    # fi

    if alias aprmdirstructmiller &>/dev/null; then
        aprmdirstructmiller
    fi

    if alias aprmglobalsymlinkmiller &>/dev/null; then
        aprmglobalsymlinkmiller
    fi
}

alias millercsv='ap_alias_miller_view'
alias millertsv='ap_alias_miller_view tsv'
alias millerjson='ap_alias_miller_view json'
# @$func $$ ap_func_miller_view {
# ap_func_miller_view [-dp] <domain/ip> <port> [--] *<src_path> <dst_path>
# Description
#
# Options
#   -d
# Parameters
#   <dst>   dest
# Return status
#   AP_CODE_SUCCESS
# }
ap_func_miller_view() {
    local ap_opts_string=":tj"
    local ap_opt=""
    local ap_opt_t=0
    local ap_opt_j=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "t")
            ap_opt_t=1
            ;;
        "j")
            ap_opt_j=1
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
    local ap_input_file="$2"

    if [ "${ap_opt_t}" == 1 ]; then
        mlr --tsv --opprint --barred put '' "${ap_input_file}" | pspg --force-uniborder
    elif [ "${ap_opt_j}" == 1 ]; then
        mlr --json --opprint --barred put '' "${ap_input_file}" | pspg --force-uniborder
    else
        mlr --csv --opprint --barred put '' "${ap_input_file}" | pspg --force-uniborder
    fi

    aprtn_success
}
