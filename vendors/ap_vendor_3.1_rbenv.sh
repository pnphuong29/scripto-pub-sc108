alias apinitrbenv="ap_func_init_rbenv"
ap_func_init_rbenv() {
    apaddpath "${HOME}/.rbenv/bin"
    eval "$("${HOME}/.rbenv/bin/rbenv" init - bash)"
    # eval "$(rbenv init - bash)"

    if alias apinitrbenvshare &>/dev/null; then
        apinitrbenvshare
    fi

    if alias apinitrbenvcommon &>/dev/null; then
        apinitrbenvcommon
    fi

    if alias apinitrubyshare &>/dev/null; then
        apinitrubyshare
    fi

    if alias apinitrubycommon &>/dev/null; then
        apinitrubycommon
    fi
}

alias apcreatedirstructrbenv="ap_func_create_dirstruct_rbenv"
ap_func_create_dirstruct_rbenv() {
    aplogshow "Set rbenv local version [${AP_RUBY_VERSION_DEFAULT}] at [${HOME}]\n"
    cd "${HOME}"
    rbenv local "${AP_RUBY_VERSION_DEFAULT}"

    if alias apcreatedirstructrbenvshare &>/dev/null; then
        apcreatedirstructrbenvshare
    fi

    if alias apcreatedirstructrbenvcommon &>/dev/null; then
        apcreatedirstructrbenvcommon
    fi

    if alias apcreatedirstructruby &>/dev/null; then
        apcreatedirstructruby
    fi
}

alias aprmdirstructrbenv="ap_func_rm_dirstruct_rbenv"
ap_func_rm_dirstruct_rbenv() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/rbenv]\n"
    rm -f "${AP_SOFT_DIR}/bin/rbenv"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_rbenv.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rbenv.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/rbenv.1]\n"
    rm -f "${AP_MAN_DIR}/man1/rbenv.1"

    if alias aprmdirstructrbenvshare &>/dev/null; then
        aprmdirstructrbenvshare
    fi

    if alias aprmdirstructrbenvcommon &>/dev/null; then
        aprmdirstructrbenvcommon
    fi

    if alias aprmdirstructruby &>/dev/null; then
        aprmdirstructruby
    fi
}

alias apcreateglobalsymlinkrbenv="ap_func_create_global_symlink_rbenv"
ap_func_create_global_symlink_rbenv() {
    if [ -f "${HOME}/.rbenv/shims/ruby" ]; then
        aplogshow "Create symlink from [/usr/local/bin/ruby] to [${HOME}/.rbenv/shims/ruby]\n"
        sudo ln -sf "${HOME}/.rbenv/shims/ruby" "/usr/local/bin/ruby"
    fi

    if [ -f "${HOME}/.rbenv/shims/gem" ]; then
        aplogshow "Create symlink from [/usr/local/bin/gem] to [${HOME}/.rbenv/shims/gem]\n"
        sudo ln -sf "${HOME}/.rbenv/shims/gem" "/usr/local/bin/gem"
    fi

    if [ -f "${HOME}/.rbenv/shims/bundle" ]; then
        aplogshow "Create symlink from [/usr/local/bin/bundle] to [${HOME}/.rbenv/shims/bundle]\n"
        sudo ln -sf "${HOME}/.rbenv/shims/bundle" "/usr/local/bin/bundle"
    fi

    if [ -f "${HOME}/.rbenv/shims/bundler" ]; then
        aplogshow "Create symlink from [/usr/local/bin/bundler] to [${HOME}/.rbenv/shims/bundler]\n"
        sudo ln -sf "${HOME}/.rbenv/shims/bundler" "/usr/local/bin/bundler"
    fi
}

alias aprmglobalsymlinkrbenv="ap_func_rm_global_symlink_rbenv"
ap_func_rm_global_symlink_rbenv() {
    aplogshow "Remove [/usr/local/bin/ruby]\n"
    sudo rm -f "/usr/local/bin/ruby"

    aplogshow "Remove [/usr/local/bin/gem]\n"
    sudo rm -f "/usr/local/bin/gem"

    aplogshow "Remove [/usr/local/bin/bundle]\n"
    sudo rm -f "/usr/local/bin/bundle"

    aplogshow "Remove [/usr/local/bin/bundler]\n"
    sudo rm -f "/usr/local/bin/bundler"
}

alias apsetuprbenv="ap_func_setup_rbenv"
ap_func_setup_rbenv() {
    # https://github.com/rbenv/rbenv
    aplogshow "Install [rbenv]\n"

    # Remove old rbenv dir if any
    rm -rf "${HOME}/.rbenv"

    # Install rbenv
    git clone https://github.com/rbenv/rbenv.git "${HOME}/.rbenv"
    cd "${HOME}/.rbenv" && src/configure && make -C src

    # Prepend rbenv path to current PATH
    apaddpath "${HOME}/.rbenv/bin"

    # Init rbenv
    eval "$("${HOME}/.rbenv/bin/rbenv" init - bash)"
    # eval "$(rbenv init - bash)"

    # Verify installation of rbenv
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash

    # Install ruby-build (rbenv install)
    mkdir -p "$(rbenv root)"/plugins
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

    # Install ruby
    aplogshow "Install [ruby v${AP_RUBY_VERSION_DEFAULT}]\n"
    rbenv install "${AP_RUBY_VERSION_DEFAULT}"

    # Set default global ruby version
    aplogshow "Set rbenv global version [${AP_RUBY_VERSION_DEFAULT}]\n"
    rbenv global "${AP_RUBY_VERSION_DEFAULT}"

    # Install gems
    aplogshow "Installing [neovim, solargraph, asciidoctor]\n"
    gem install \
        neovim \
        solargraph \
        asciidoctor

    apinitrbenv
    if alias apcreatedirstructrbenv &>/dev/null; then
        apcreatedirstructrbenv
    fi
}

alias aprmrbenv="ap_func_rm_rbenv"
ap_func_rm_rbenv() {
    aplogshow "Remove [rbenv]\n"
    rm -rf "${HOME}/.rbenv"

    if alias aprmdirstructrbenv &>/dev/null; then
        aprmdirstructrbenv
    fi
}
