for ap_vendor in "${AP_SCRIPTO_DIR}/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"
    ap_vendor_name="${ap_vendor_name/_/}"

    # Alias - Vi commands
    if [ -f "${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh" ]; then
        ap_cmd="alias @visc${ap_vendor_name}='@vi -p \
            ${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh \
            ${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh \
        '"
    else
        ap_cmd="alias @visc${ap_vendor_name}='@vi -p \
            ${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh \
        '"
    fi
    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done

for ap_vendor in "${AP_SCRIPTO_COMMON_DIR}/vendors"/ap_vendor_*.sh; do
    ap_vendor_name="${ap_vendor##*/}"
    ap_vendor_name="${ap_vendor_name/ap_vendor_/}"
    ap_vendor_name="${ap_vendor_name/\.sh/}"

    # Alias - Vi commands
    ap_cmd="alias @visc${ap_vendor_name}='@vi -p \
        ${AP_SCRIPTO_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh \
        ${AP_SCRIPTO_COMMON_DIR}/vendors/ap_vendor_${ap_vendor_name}.sh \
	'"
    # @minfo "Execute command [${ap_cmd}]\n"
    eval "$(printf "%s" "${ap_cmd}")"
done
