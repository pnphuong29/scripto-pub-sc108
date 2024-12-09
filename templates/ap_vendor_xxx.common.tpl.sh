alias apinitxxxcommon="ap_func_init_xxx_common"
ap_func_init_xxx_common() {

}

alias apcreatedirstructxxxcommon="ap_func_create_dirstruct_xxx_common"
ap_func_create_dirstruct_xxx_common() {
    if [ -f "${HOME}/scripto-common/vendors/xxx/bindings.json" ]; then
        aplogshow "Create symlink from [${HOME}/.config/xxx/bindings.json] to [${HOME}/scripto-common/vendors/xxx/bindings.json]\n"
        ln -sf "${HOME}/scripto-common/vendors/xxx/bindings.json" "${HOME}/.config/xxx/bindings.json"
    fi
}

alias aprmdirstructxxxcommon="ap_func_rm_dirstruct_xxx_common"
ap_func_rm_dirstruct_xxx_common() {
    rm -f "${HOME}/.config/xxx/bindings.json"
}
