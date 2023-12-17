# https://github.com/ogham/exa
# https://pandoc.org
# https://github.com/rust-lang/git2-rs
# https://github.com/casey/just
# Dependencies: ghq, just (rust), pandoc, libgit2 (rust), git-delta (rust)

export AP_VENDORS_RUST_EXA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-exa"
export AP_VENDORS_RUST_EXA_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_EXA_SETUP_DIR}/configs"
export AP_VENDORS_EXA_REPO_URL="https://github.com/ogham/exa"
export AP_VENDORS_EXA_GH_DIR="${AP_GH_DIR}/ogham/exa"

if type cargo &>/dev/null; then
    export AP_VENDORS_EXA_DIR="${AP_VENDORS_EXA_GH_DIR}"
    @logshow "Installing [exa] from building source codes using [cargo]\n"

    # Remove old exa dir if any
    rm -rf "${AP_VENDORS_EXA_DIR}"

    # Install exa
    ghq get "${AP_VENDORS_EXA_REPO_URL}"
    cd "${AP_VENDORS_EXA_DIR}"
    cargo build --release

    # Add bin dir to PATH
    @addpath "${AP_VENDORS_EXA_DIR}/target/release"
    sudo ln -sf "${AP_VENDORS_EXA_DIR}/target/release/exa" /usr/local/bin/exa

    # Generating man page
    if type just &>/dev/null; then
        if type pandoc &>/dev/null; then
            just man
            ln -sf "$(gfind "${AP_VENDORS_EXA_DIR}" -name "exa.1")" "${AP_MAN_DIR}/man1/exa.1"
            ln -sf "$(gfind "${AP_VENDORS_EXA_DIR}" -name "exa_colors.5")" "${AP_MAN_DIR}/man5/exa_colors.5"
        else
            @logshow "Cannot find [pandoc] to install man page for [exa]\n"
        fi
    else
        @logshow "Cannot find [just] to install man page for [exa]\n"
    fi

    # Autocomplete
    ln -sf "${AP_VENDORS_EXA_DIR}/completions/bash/exa" "${AP_COMPLETIONS_DIR}/ap_completion_exa.bash"
else
    export AP_VENDORS_EXA_DIR="${AP_SOFT_DIR}/exa"
    @logshow "Installing [exa] from precompiled file\n"

    # Remove old exa dir if any
    rm -rf "${AP_VENDORS_EXA_DIR}"

    # Install exa
    ap_os_type="linux-x86_64-musl"
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        ap_os_type="macos-x86_64"
    fi

    cd "${AP_TMP_DIR}"
    curl -LO "${AP_VENDORS_EXA_REPO_URL}/releases/download/v0.10.1/{exa-${ap_os_type}-v0.10.1.zip}"
    rm -rf exa
    unzip "exa-${ap_os_type}-v0.10.1.zip" -d exa
    mv exa "${AP_SOFT_DIR}/"

    # Add bin dir to PATH
    @addpath "${AP_VENDORS_EXA_DIR}/bin"
    sudo ln -sf "${AP_VENDORS_EXA_DIR}/bin/exa" /usr/local/bin/exa

    # Man page
    ln -sf "${AP_VENDORS_EXA_DIR}/man/exa.1" "${AP_MAN_DIR}/man1/exa.1"
    ln -sf "${AP_VENDORS_EXA_DIR}/man/exa_colors.5" "${AP_MAN_DIR}/man5/exa_colors.5"

    # Autocomplete
    ln -sf "${AP_VENDORS_EXA_DIR}/completions/exa.bash" "${AP_COMPLETIONS_DIR}/exa.bash"
fi

if type exa &>/dev/null; then
    @logshowpassed "[exa] has been installed successfully\n"
else
    @logshowfailed "[exa] has been installed unsuccessfully\n"
fi
