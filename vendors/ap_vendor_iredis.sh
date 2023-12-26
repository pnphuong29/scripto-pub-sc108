alias @initiredis="ap_func_init_iredis"
ap_func_init_iredis() {
    alias @iredis="iredis -a \$(showredispasswd)"
}
