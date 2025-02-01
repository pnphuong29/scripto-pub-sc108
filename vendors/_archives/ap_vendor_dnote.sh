# alias apinitdnotecommon="ap_func_init_dnote_common"
# ap_func_init_dnote_common() {

# }

alias apcreatedirstructdnotecommon="ap_func_create_dirstruct_dnote_common"
ap_func_create_dirstruct_dnote_common() {
    if [ -f "${HOME}/scripto-common/vendors/dnote/dnoterc" ]; then
        aplogshow "Create symlink from [${HOME}/.config/dnote/dnoterc] to [${HOME}/scripto-common/vendors/dnote/dnoterc]\n"
        mkdir -p "${HOME}/.config/dnote"
        ln -sf "${HOME}/scripto-common/vendors/dnote/dnoterc" "${HOME}/.config/dnote/dnoterc"
    fi
}

# alias aprmdirstructdnotecommon="ap_func_rm_dirstruct_dnote_common"
# ap_func_rm_dirstruct_dnote_common() {

# }
