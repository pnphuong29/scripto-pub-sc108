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

alias millercsv='ap_alias_miller_view csv'
alias millertsv='ap_alias_miller_view tsv'
alias millerjson='ap_alias_miller_view json'
alias ap_alias_miller_view='ap_func_miller_view'
# @$func $$ ap_func_miller_view {
# ap_func_miller_view *<file_type> *<input_file>
# Description
#   Use miller and pspg to view CSV, TSV and JSON file
# Return status
#   AP_CODE_SUCCESS
# }
ap_func_miller_view() {
    local ap_file_type="$1"
    local ap_input_file="$2"
    local ap_cmd

    ap_cmd="mlr --${ap_file_type} --opprint --barred put '' \"${ap_input_file}\" | pspg --force-uniborder"

    aplogshow "Execute [${ap_cmd}]\n"
    eval "${ap_cmd}"

    aprtn_success
}
