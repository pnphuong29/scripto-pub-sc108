ap_vendor_name_arr=()

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

    # @minfo "Execute command [${ap_cmd}]\n"
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

    # @minfo "Execute command [${ap_cmd}]\n"
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

    # @minfo "Execute command [${ap_cmd}]\n"
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

    # @minfo "Execute command [${ap_cmd}]\n"
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
    # @minfo "Execute command [${ap_cmd}]\n"
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
    # @minfo "Execute command [${ap_cmd}]\n"
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
    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

# Alias - Vi script test bash commands
if [ ! -d "${HOME}/scripto-share/tests" ]; then
    mkdir -p "${HOME}/scripto-share/tests"
fi

if [ ! -d "${HOME}/scripto-common/tests" ]; then
    mkdir -p "${HOME}/scripto-common/tests"
fi

if [ ! -d "${HOME}/scripto-main/tests" ]; then
    mkdir -p "${HOME}/scripto-main/tests"
fi

for i in {1..10}; do
    eval "$(printf "%s" "alias visrtb${i}='vi ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsrtb${i}='source ${HOME}/scripto-share/tests/ap_test_bash_${i}.sh'")"

    eval "$(printf "%s" "alias visctb${i}='vi ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsctb${i}='source ${HOME}/scripto-common/tests/ap_test_bash_${i}.sh'")"

    eval "$(printf "%s" "alias vismtb${i}='vi ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'")"
    eval "$(printf "%s" "alias runsmtb${i}='source ${HOME}/scripto-main/tests/ap_test_bash_${i}.sh'")"
done
