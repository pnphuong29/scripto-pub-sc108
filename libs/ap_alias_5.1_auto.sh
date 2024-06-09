ap_vendor_name_arr=()

# Scripto - Copy setup script in sc35
ap_script_codes=(sc7 sc21 sc49 sc74)
for ap_script_code in "${ap_script_codes[@]}"; do
    ap_cmd="alias cpsetup${ap_script_code}='printf \"source <(curl -SL \"https://raw.githubusercontent.com/pnphuong29/scripto-setup-pub-sc35/master/ap_setup_${ap_script_code}.sh\")\" | apcopy'"
    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Scripto - visc commands
for ap_vendor in "${HOME}/scripto/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"
    ap_vendor_name="${ap_vendor_name/_/}"
    ap_vendor_name_arr+=("${ap_vendor_name}")

    # Alias - visc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p"
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

    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Scripto Common - visc commands
for ap_vendor in "${HOME}/scripto-common/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"
    ap_vendor_name="${ap_vendor_name/_/}"

    if [[ ${ap_vendor_name_arr[@]} =~ "${ap_vendor_name}" ]]; then
        continue
    fi
    ap_vendor_name_arr+=("${ap_vendor_name}")

    # Alias - visc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
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

    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Scripto Share - visc commands
for ap_vendor in "${HOME}/scripto-share/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"
    ap_vendor_name="${ap_vendor_name/_/}"

    if [[ ${ap_vendor_name_arr[@]} =~ "${ap_vendor_name}" ]]; then
        continue
    fi
    ap_vendor_name_arr+=("${ap_vendor_name}")

    # Alias - visc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
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

    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Scripto Main - visc commands
for ap_vendor in "${HOME}/scripto-main/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"
    ap_vendor_name="${ap_vendor_name/_/}"

    if [[ ${ap_vendor_name_arr[@]} =~ "${ap_vendor_name}" ]]; then
        continue
    fi
    ap_vendor_name_arr+=("${ap_vendor_name}")

    # Alias - visc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p \"${HOME}/scripto-common/vendors/ap_vendor_${ap_vendor_name}.sh\""
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

    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Scripto Share - vidk commands
for ap_dkc_file in "${HOME}/scripto-share/dockers"/ap_dkc_*.yml; do
    ap_dkc_name="${ap_dkc_file##*/}"
    ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
    ap_dkc_code="${ap_dkc_code/\.yml/}"
    ap_dkc_code="${ap_dkc_code/_/}"

    # Alias - Vi docker commands
    ap_cmd="alias vidk${ap_dkc_code}='vi -p \
        ${HOME}/scripto-common/dockers/ap_dkc_common.sh \
        ${ap_dkc_file} \
	'"
    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Scripto Common - vidk commands
for ap_dkc_file in "${HOME}/scripto-common/dockers"/ap_dkc_*.yml; do
    ap_dkc_name="${ap_dkc_file##*/}"
    ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
    ap_dkc_code="${ap_dkc_code/\.yml/}"
    ap_dkc_code="${ap_dkc_code/_/}"

    # Alias - Vi docker commands
    ap_cmd="alias vidk${ap_dkc_code}='vi -p \
        ${HOME}/scripto-common/dockers/ap_dkc_common.sh \
        ${ap_dkc_file} \
	'"
    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Scripto Main - vidk commands
for ap_dkc_file in "${HOME}/scripto-main/dockers"/ap_dkc_*.yml; do
    ap_dkc_name="${ap_dkc_file##*/}"
    ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
    ap_dkc_code="${ap_dkc_code/\.yml/}"
    ap_dkc_code="${ap_dkc_code/_/}"

    # Alias - Vi docker commands
    ap_cmd="alias vidk${ap_dkc_code}='vi -p \
        ${HOME}/scripto-common/dockers/ap_dkc_common.sh \
        ${ap_dkc_file} \
	'"
    # apshowmsginfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Alias - Vi script test scripts
if [ ! -d "${HOME}/scripto-share/tests" ]; then
    mkdir -p "${HOME}/scripto-share/tests"
fi

if [ ! -d "${HOME}/scripto-common/tests" ]; then
    mkdir -p "${HOME}/scripto-common/tests"
fi

if [ ! -d "${HOME}/scripto-main/tests" ]; then
    mkdir -p "${HOME}/scripto-main/tests"
fi

for i in {1..7}; do
    eval "$(printf "%s" "alias visrtb${i}='vi ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsrtb${i}='source ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'")"

    eval "$(printf "%s" "alias visctb${i}='vi ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsctb${i}='source ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'")"

    eval "$(printf "%s" "alias vismtb${i}='vi ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsmtb${i}='source ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'")"
done

for i in {1..7}; do
    eval "$(printf "%s" "alias visrtpy${i}='vi ${HOME}/scripto-share/tests/ap_test_py_${i}.py'")"
    eval "$(printf "%s" "alias runsrtpy${i}='source ${HOME}/scripto-share/tests/ap_test_py_${i}.py'")"

    eval "$(printf "%s" "alias visctpy${i}='vi ${HOME}/scripto-common/tests/ap_test_py_${i}.py'")"
    eval "$(printf "%s" "alias runsctpy${i}='source ${HOME}/scripto-common/tests/ap_test_py_${i}.py'")"

    eval "$(printf "%s" "alias vismtpy${i}='vi ${HOME}/scripto-main/tests/ap_test_py_${i}.py'")"
    eval "$(printf "%s" "alias runsmtpy${i}='source ${HOME}/scripto-main/tests/ap_test_py_${i}.py'")"
done

for i in {1..10}; do
    eval "$(printf "%s" "alias videvpy${i}='vi ${AP_PRJ_DEV1_DIR}/py/test_py_${i}.py'")"
    eval "$(printf "%s" "alias rundevpy${i}='source ${AP_PRJ_DEV1_DIR}/py/test_py_${i}.py'")"
done

for i in {1..10}; do
    eval "$(printf "%s" "alias videvts${i}='vi ${AP_PRJ_DEV1_DIR}/ts/test_ts_${i}.ts'")"
    eval "$(printf "%s" "alias rundevts${i}='source ${AP_PRJ_DEV1_DIR}/ts/test_ts_${i}.ts'")"
done
