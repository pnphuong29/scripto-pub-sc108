if [ -s "${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh" ] && [ "$(cat "${AP_CONF_GENERATE_CACHE_FILE}")" == '1' ]; then
    echo "Using cache file [sc108_ap_alias_5.1_auto.sh]"
    source "${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
else
    echo "Renewing cache file [sc108_ap_alias_5.1_auto.sh]"
    true >"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    ap_vendor_name_arr=()

    # Scripto - Copy setup script in sc35
    ap_script_codes=(sc7 sc21 sc49)
    for ap_script_code in "${ap_script_codes[@]}"; do
        ap_cmd="alias cpsetup${ap_script_code}='printf \"source <(curl -SL \"https://raw.githubusercontent.com/pnphuong29/scripto-setup-pub-sc35/master/ap_setup_${ap_script_code}.sh\")\" | apcopy'"
        # aplogdebug "Execute command [${ap_cmd}]\n"
        # eval "$(printf "%s" "${ap_cmd}")"
        printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # TODO: Some vendors including number in their name, so we need to handle this case
    # Scripto - Edit sc vendors
    for ap_vendor in "${HOME}/scripto/vendors"/ap_vendor_*.sh; do
        ap_vendor_name="${ap_vendor##*/}"
        ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
        ap_vendor_name="${ap_vendor_name/\.sh/}"
        ap_vendor_name="${ap_vendor_name/_/}"
        ap_vendor_name_arr+=("${ap_vendor_name}")

        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            ap_cmd="alias ${ap_editor}sc${ap_vendor_name}='${ap_editor}"

            if [ "${ap_editor}" == "vi" ]; then
                ap_cmd="${ap_cmd} -p"
            fi

            if [ -f "${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            ap_cmd="${ap_cmd}'"

            # aplogdebug "Execute command [${ap_cmd}]\n"
            # eval "$(printf "%s" "${ap_cmd}")"
            printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Scripto Common - Edit sc vendors
    for ap_vendor in "${HOME}/scripto-common/vendors"/ap_vendor_*.sh; do
        ap_vendor_name="${ap_vendor##*/}"
        ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
        ap_vendor_name="${ap_vendor_name/\.sh/}"
        ap_vendor_name="${ap_vendor_name/_/}"

        if [[ ${ap_vendor_name_arr[@]} =~ "${ap_vendor_name}" ]]; then
            continue
        fi
        ap_vendor_name_arr+=("${ap_vendor_name}")

        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            ap_cmd="alias ${ap_editor}sc${ap_vendor_name}='${ap_editor}"

            if [ "${ap_editor}" == "vi" ]; then
                ap_cmd="${ap_cmd} -p"
            fi

            ap_cmd="${ap_cmd} \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
            if [ -f "${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            ap_cmd="${ap_cmd}'"

            # aplogdebug "Execute command [${ap_cmd}]\n"
            # eval "$(printf "%s" "${ap_cmd}")"
            printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Scripto Share - Edit sc vendors
    for ap_vendor in "${HOME}/scripto-share/vendors"/ap_vendor_*.sh; do
        ap_vendor_name="${ap_vendor##*/}"
        ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
        ap_vendor_name="${ap_vendor_name/\.sh/}"
        ap_vendor_name="${ap_vendor_name/_/}"

        if [[ ${ap_vendor_name_arr[@]} =~ "${ap_vendor_name}" ]]; then
            continue
        fi
        ap_vendor_name_arr+=("${ap_vendor_name}")

        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            ap_cmd="alias ${ap_editor}sc${ap_vendor_name}='${ap_editor}"

            if [ "${ap_editor}" == "vi" ]; then
                ap_cmd="${ap_cmd} -p"
            fi

            ap_cmd="${ap_cmd} \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
            if [ -f "${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            ap_cmd="${ap_cmd}'"

            # aplogdebug "Execute command [${ap_cmd}]\n"
            # eval "$(printf "%s" "${ap_cmd}")"
            printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Scripto Main - Edit sc vendors
    for ap_vendor in "${HOME}/scripto-main/vendors"/ap_vendor_*.sh; do
        ap_vendor_name="${ap_vendor##*/}"
        ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
        ap_vendor_name="${ap_vendor_name/\.sh/}"
        ap_vendor_name="${ap_vendor_name/_/}"

        if [[ ${ap_vendor_name_arr[@]} =~ "${ap_vendor_name}" ]] || [ "${ap_vendor_name}" == '*' ]; then
            continue
        fi
        ap_vendor_name_arr+=("${ap_vendor_name}")

        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            ap_cmd="alias ${ap_editor}sc${ap_vendor_name}='${ap_editor}"

            if [ "${ap_editor}" == "vi" ]; then
                ap_cmd="${ap_cmd} -p"
            fi

            ap_cmd="${ap_cmd} \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
            if [ -f "${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-share/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            if [ -f "${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
                ap_cmd="${ap_cmd} \"${HOME}/scripto-main/vendors/ap_vendor_${ap_vendor_name}.sh\""
            fi

            ap_cmd="${ap_cmd}'"

            # aplogdebug "Execute command [${ap_cmd}]\n"
            # eval "$(printf "%s" "${ap_cmd}")"
            printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Scripto Share - Edit sc docker compose files
    for ap_dkc_file in "${HOME}/scripto-share/dockers"/ap_dkc_*.yml; do
        ap_dkc_name="${ap_dkc_file##*/}"
        ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
        ap_dkc_code="${ap_dkc_code/\.yml/}"
        ap_dkc_code="${ap_dkc_code/_/}"

        if [ "${ap_dkc_name}" == '*' ]; then
            continue
        fi

        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            ap_cmd="alias ${ap_editor}dk${ap_dkc_name}='${ap_editor}"

            if [ "${ap_editor}" == "vi" ]; then
                ap_cmd="${ap_cmd} -p"
            fi

            ap_cmd="${ap_cmd} \
                ${HOME}/scripto-share/dockers/ap_dkc_common.sh \
                ${HOME}/scripto-common/dockers/ap_dkc_common.sh \
                ${ap_dkc_file} \
            '"
            # aplogdebug "Execute command [${ap_cmd}]\n"
            # eval "$(printf "%s" "${ap_cmd}")"
            printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Scripto Common - Edit sc docker compose files
    for ap_dkc_file in "${HOME}/scripto-common/dockers"/ap_dkc_*.yml; do
        ap_dkc_name="${ap_dkc_file##*/}"
        ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
        ap_dkc_code="${ap_dkc_code/\.yml/}"
        ap_dkc_code="${ap_dkc_code/_/}"

        if [ "${ap_dkc_name}" == '*' ]; then
            continue
        fi

        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            ap_cmd="alias ${ap_editor}dk${ap_dkc_name}='${ap_editor}"

            if [ "${ap_editor}" == "vi" ]; then
                ap_cmd="${ap_cmd} -p"
            fi

            ap_cmd="${ap_cmd} \
                ${HOME}/scripto-share/dockers/ap_dkc_common.sh \
                ${HOME}/scripto-common/dockers/ap_dkc_common.sh \
                ${ap_dkc_file} \
            '"
            # aplogdebug "Execute command [${ap_cmd}]\n"
            # eval "$(printf "%s" "${ap_cmd}")"
            printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Scripto Main - Edit sc docker compose files
    for ap_dkc_file in "${HOME}/scripto-main/dockers"/ap_dkc_*.yml; do
        ap_dkc_name="${ap_dkc_file##*/}"
        ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
        ap_dkc_code="${ap_dkc_code/\.yml/}"
        ap_dkc_code="${ap_dkc_code/_/}"

        if [ "${ap_dkc_name}" == '*' ]; then
            continue
        fi

        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            ap_cmd="alias ${ap_editor}dk${ap_dkc_name}='${ap_editor}"

            if [ "${ap_editor}" == "vi" ]; then
                ap_cmd="${ap_cmd} -p"
            fi

            ap_cmd="${ap_cmd} \
                ${HOME}/scripto-share/dockers/ap_dkc_common.sh \
                ${HOME}/scripto-common/dockers/ap_dkc_common.sh \
                ${ap_dkc_file} \
            '"
            # aplogdebug "Execute command [${ap_cmd}]\n"
            # eval "$(printf "%s" "${ap_cmd}")"
            printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Alias - Edit test scripts
    for i in {1..14}; do
        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            # eval "$(printf "%s" "alias ${ap_editor}srtb${i}='${ap_editor} ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'")"
            printf "%s\n" "alias ${ap_editor}srtb${i}='${ap_editor} ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
            # eval "$(printf "%s" "alias ${ap_editor}sctb${i}='${ap_editor} ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'")"
            printf "%s\n" "alias ${ap_editor}sctb${i}='${ap_editor} ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
            # eval "$(printf "%s" "alias ${ap_editor}smtb${i}='${ap_editor} ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'")"
            printf "%s\n" "alias ${ap_editor}smtb${i}='${ap_editor} ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
        # eval "$(printf "%s" "alias runsrtb${i}='source ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'")"
        printf "%s\n" "alias runsrtb${i}='source ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        # eval "$(printf "%s" "alias runsctb${i}='source ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'")"
        printf "%s\n" "alias runsctb${i}='source ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        # eval "$(printf "%s" "alias runsmtb${i}='source ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'")"
        printf "%s\n" "alias runsmtb${i}='source ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    for i in {1..14}; do
        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            # eval "$(printf "%s" "alias ${ap_editor}srtpy${i}='${ap_editor} ${HOME}/scripto-share/tests/ap_test_py_${i}.py'")"
            printf "%s\n" "alias ${ap_editor}srtpy${i}='${ap_editor} ${HOME}/scripto-share/tests/ap_test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
            # eval "$(printf "%s" "alias ${ap_editor}sctpy${i}='${ap_editor} ${HOME}/scripto-common/tests/ap_test_py_${i}.py'")"
            printf "%s\n" "alias ${ap_editor}sctpy${i}='${ap_editor} ${HOME}/scripto-common/tests/ap_test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
            # eval "$(printf "%s" "alias ${ap_editor}smtpy${i}='${ap_editor} ${HOME}/scripto-main/tests/ap_test_py_${i}.py'")"
            printf "%s\n" "alias ${ap_editor}smtpy${i}='${ap_editor} ${HOME}/scripto-main/tests/ap_test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
        # eval "$(printf "%s" "alias runsrtpy${i}='source ${HOME}/scripto-share/tests/ap_test_py_${i}.py'")"
        printf "%s\n" "alias runsrtpy${i}='source ${HOME}/scripto-share/tests/ap_test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        # eval "$(printf "%s" "alias runsctpy${i}='python ${HOME}/scripto-common/tests/ap_test_py_${i}.py'")"
        printf "%s\n" "alias runsctpy${i}='python ${HOME}/scripto-common/tests/ap_test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        # eval "$(printf "%s" "alias runsmtpy${i}='python ${HOME}/scripto-main/tests/ap_test_py_${i}.py'")"
        printf "%s\n" "alias runsmtpy${i}='python ${HOME}/scripto-main/tests/ap_test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    for i in {1..14}; do
        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            # eval "$(printf "%s" "alias ${ap_editor}devpy${i}='${ap_editor} ${AP_PRJ_DEV1_DIR}/py/test_py_${i}.py'")"
            printf "%s\n" "alias ${ap_editor}devpy${i}='${ap_editor} ${AP_PRJ_DEV1_DIR}/py/test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
        # eval "$(printf "%s" "alias rundevpy${i}='python ${AP_PRJ_DEV1_DIR}/py/test_py_${i}.py'")"
        printf "%s\n" "alias rundevpy${i}='python ${AP_PRJ_DEV1_DIR}/py/test_py_${i}.py'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    for i in {1..14}; do
        for ap_editor in "${AP_EDITOR_ARR[@]}"; do
            # eval "$(printf "%s" "alias ${ap_editor}devts${i}='${ap_editor} ${AP_PRJ_DEV1_DIR}/ts/test_ts_${i}.ts'")"
            printf "%s\n" "alias ${ap_editor}devts${i}='${ap_editor} ${AP_PRJ_DEV1_DIR}/ts/test_ts_${i}.ts'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
        done
        # eval "$(printf "%s" "alias rundevts${i}='source ${AP_PRJ_DEV1_DIR}/ts/test_ts_${i}.ts'")"
        printf "%s\n" "alias rundevts${i}='source ${AP_PRJ_DEV1_DIR}/ts/test_ts_${i}.ts'" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Alias - Edit logs
    for ap_editor in "${AP_EDITOR_ARR[@]}"; do
        ap_cmd="alias ${ap_editor}logs='${ap_editor}"

        if [ "${ap_editor}" == "vi" ]; then
            ap_cmd="${ap_cmd} -p"
        fi

        ap_cmd="${ap_cmd} \
            ${AP_LOGS_DIR}/general/ap_debug.log \
            ${AP_LOGS_DIR}/general/ap_error.log \
            ${AP_LOGS_DIR}/general/ap_general.log \
            ${AP_LOGS_DIR}/crontabs/ap_crontab_test.log \
        '"
        # aplogdebug "Execute command [${ap_cmd}]\n"
        # eval "$(printf "%s" "${ap_cmd}")"
        printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Alias - Edit setup vendor scripts
    for ap_editor in "${AP_EDITOR_ARR[@]}"; do
        ap_cmd="alias ${ap_editor}setupvendors='${ap_editor}"

        if [ "${ap_editor}" == "vi" ]; then
            ap_cmd="${ap_cmd} -p"
        fi

        ap_cmd="${ap_cmd} \
            ${HOME}/scripto-common/utils/setup-vendors/ap_setup_macos.sh \
            ${HOME}/scripto-common/utils/setup-vendors/ap_setup_ubuntu.sh \
            ${HOME}/scripto-common/utils/setup-vendors/ap_setup_server.sh \
        '"
        # aplogdebug "Execute command [${ap_cmd}]\n"
        # eval "$(printf "%s" "${ap_cmd}")"
        printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    # Alias - Edit cache files
    for ap_editor in "${AP_EDITOR_ARR[@]}"; do
        ap_cmd="alias ${ap_editor}cachefiles='${ap_editor}"

        if [ "${ap_editor}" == "vi" ]; then
            ap_cmd="${ap_cmd} -p"
        fi

        for ap_cache_file in "${AP_CACHE_DIR}"/*.sh; do
            ap_cmd="${ap_cmd} ${ap_cache_file}"
        done
        ap_cmd="${ap_cmd}'"

        # aplogdebug "Execute command [${ap_cmd}]\n"
        # eval "$(printf "%s" "${ap_cmd}")"
        printf "%s\n" "${ap_cmd}" >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
    done
    echo >>"${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"

    source "${AP_CACHE_DIR}/sc108_ap_alias_5.1_auto.sh"
fi
