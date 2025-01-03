alias apinituv="ap_func_init_uv"
ap_func_init_uv() {
    alias uvupdate='uv self update'

    if alias apinituvshare &>/dev/null; then
        apinituvshare
    fi

    if alias apinituvcommon &>/dev/null; then
        apinituvcommon
    fi

    if alias apinituvmain &>/dev/null; then
        apinituvmain
    fi
}

alias apcreatedirstructuv="ap_func_create_dirstruct_uv"
ap_func_create_dirstruct_uv() {
    aplogshow "Generate [uv] bash autocomplete\n"

    uv generate-shell-completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_uv.bash"
    uvx --generate-shell-completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_uvx.bash"

    if alias apcreatedirstructuvshare &>/dev/null; then
        apcreatedirstructuvshare
    fi

    if alias apcreatedirstructuvcommon &>/dev/null; then
        apcreatedirstructuvcommon
    fi

    if alias apcreatedirstructuvmain &>/dev/null; then
        apcreatedirstructuvmain
    fi
}

alias aprmdirstructuv="ap_func_rm_dirstruct_uv"
ap_func_rm_dirstruct_uv() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_uv.bash]\n"

    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_uv.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_uvx.bash"

    if alias aprmdirstructuvshare &>/dev/null; then
        aprmdirstructuvshare
    fi

    if alias aprmdirstructuvcommon &>/dev/null; then
        aprmdirstructuvcommon
    fi

    if alias aprmdirstructuvmain &>/dev/null; then
        aprmdirstructuvmain
    fi
}

alias apsetupuv="ap_func_setup_uv"
ap_func_setup_uv() {
    aplogshow "Install [uv]\n"

    curl -LsSf https://astral.sh/uv/install.sh | sh # Do not know how to uninstall using this way
    # cargo install --git https://github.com/astral-sh/uv uv # Take long time to install
    # pipx install uv

    apinituv
    if alias apcreatedirstructuv &>/dev/null; then
        apcreatedirstructuv
    fi
}

alias aprmuv="ap_func_rm_uv"
ap_func_rm_uv() {
    aplogshow "Remove [uv]\n"

    rm ~/.local/bin/uv ~/.local/bin/uvx
    # cargo remove uv
    # pipx uninstall uv

    if alias aprmdirstructuv &>/dev/null; then
        aprmdirstructuv
    fi

    if alias aprmglobalsymlinkuv &>/dev/null; then
        aprmglobalsymlinkuv
    fi
}
