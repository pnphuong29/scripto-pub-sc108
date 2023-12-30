for ap_vendor in "${AP_SCRIPTO_DIR}/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"
    ap_vendor_name="${ap_vendor_name/_/}"

    # Alias - Vi sc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p"
    if [ -f "${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\"'"
    fi

    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

for ap_vendor in "${AP_SCRIPTO_COMMON_DIR}/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"

    # Alias - Vi sc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p \"${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    if [ -f "${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\"'"
    fi

    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

for ap_vendor in "${AP_SCRIPTO_SHARE_DIR}/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"

    # Alias - Vi sc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p \"${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    if [ -f "${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\"'"
    fi

    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

for ap_vendor in "${AP_SCRIPTO_MAIN_DIR}/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"

    # Alias - Vi sc commands
    ap_cmd="alias visc${ap_vendor_name}='vi -p \"${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    if [ -f "${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_SHARE_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\""
    fi

    if [ -f "${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="${ap_cmd} \"${AP_SCRIPTO_MAIN_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh\"'"
    fi

    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

for ap_dkc_file in "${AP_SCRIPTO_SHARE_DIR}/dockers"/ap_dkc_*.yml; do
    ap_dkc_name="${ap_dkc_file##*/}"
    ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
    ap_dkc_code="${ap_dkc_code/\.yml/}"
    ap_dkc_code="${ap_dkc_code/_/}"

    # Alias - Vi docker commands
    ap_cmd="alias vidk${ap_dkc_code}='vi -p \
        ${ap_dkc_file} \
	'"
    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

for ap_dkc_file in "${AP_SCRIPTO_COMMON_DIR}/dockers"/ap_dkc_*.yml; do
    ap_dkc_name="${ap_dkc_file##*/}"
    ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
    ap_dkc_code="${ap_dkc_code/\.yml/}"
    ap_dkc_code="${ap_dkc_code/_/}"

    # Alias - Vi docker commands
    ap_cmd="alias vidk${ap_dkc_code}='vi -p \
        ${ap_dkc_file} \
	'"
    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

for ap_dkc_file in "${AP_SCRIPTO_MAIN_DIR}/dockers"/ap_dkc_*.yml; do
    ap_dkc_name="${ap_dkc_file##*/}"
    ap_dkc_code="${ap_dkc_name/ap_dkc_/}"
    ap_dkc_code="${ap_dkc_code/\.yml/}"
    ap_dkc_code="${ap_dkc_code/_/}"

    # Alias - Vi docker commands
    ap_cmd="alias vidk${ap_dkc_code}='vi -p \
        ${ap_dkc_file} \
	'"
    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Alias - Vi script test bash commands
if [ ! -d "${AP_SCRIPTO_SHARE_DIR}/tests" ]; then
    mkdir -p "${AP_SCRIPTO_SHARE_DIR}/tests"
fi

if [ ! -d "${AP_SCRIPTO_COMMON_DIR}/tests" ]; then
    mkdir -p "${AP_SCRIPTO_COMMON_DIR}/tests"
fi

if [ ! -d "${AP_SCRIPTO_MAIN_DIR}/tests" ]; then
    mkdir -p "${AP_SCRIPTO_MAIN_DIR}/tests"
fi

for i in {1..10}; do
    eval "$(printf "%s" "alias visrtb${i}='vi ${AP_SCRIPTO_SHARE_DIR}/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsrtb${i}='source ${AP_SCRIPTO_SHARE_DIR}/tests/ap_test_bash_${i}.sh'")"

    eval "$(printf "%s" "alias visctb${i}='vi ${AP_SCRIPTO_COMMON_DIR}/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsctb${i}='source ${AP_SCRIPTO_COMMON_DIR}/tests/ap_test_bash_${i}.sh'")"

    eval "$(printf "%s" "alias vistb${i}='vi ${AP_SCRIPTO_MAIN_DIR}/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runstb${i}='source ${AP_SCRIPTO_MAIN_DIR}/tests/ap_test_bash_${i}.sh'")"
done
