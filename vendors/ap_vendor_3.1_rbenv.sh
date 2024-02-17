alias @initrbenv="ap_func_init_rbenv"
ap_func_init_rbenv() {
    export AP_RUBY_SETUP_VERSION="3.1.4"

    @addpath "${HOME}/.rbenv/bin"
    eval "$("${HOME}/.rbenv/bin/rbenv" init - bash)"
    # eval "$(rbenv init - bash)"

    if alias @initrbenvshare &>/dev/null; then
        @initrbenvshare
    fi

    if alias @initrbenvcommon &>/dev/null; then
        @initrbenvcommon
    fi

    if alias @initrubyshare &>/dev/null; then
        @initrubyshare
    fi

    if alias @initrubycommon &>/dev/null; then
        @initrubycommon
    fi
}

alias @createdirstructrbenv="ap_func_create_dirstruct_rbenv"
ap_func_create_dirstruct_rbenv() {
    @logshow "Set rbenv local version [${AP_RUBY_SETUP_VERSION}] at [${HOME}]\n"
    cd "${HOME}"
    rbenv local "${AP_RUBY_SETUP_VERSION}"

    if alias @createdirstructrbenvshare &>/dev/null; then
        @createdirstructrbenvshare
    fi

    if alias @createdirstructrbenvcommon &>/dev/null; then
        @createdirstructrbenvcommon
    fi

    if alias @createdirstructruby &>/dev/null; then
        @createdirstructruby
    fi
}

alias @rmdirstructrbenv="ap_func_rm_dirstruct_rbenv"
ap_func_rm_dirstruct_rbenv() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/rbenv]\n"
    rm -f "${AP_SOFT_DIR}/bin/rbenv"

    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_rbenv.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rbenv.bash"

    @logshow "Remove [${AP_MAN_DIR}/man1/rbenv.1]\n"
    rm -f "${AP_MAN_DIR}/man1/rbenv.1"

    if alias @rmdirstructrbenvshare &>/dev/null; then
        @rmdirstructrbenvshare
    fi

    if alias @rmdirstructrbenvcommon &>/dev/null; then
        @rmdirstructrbenvcommon
    fi

    if alias @rmdirstructruby &>/dev/null; then
        @rmdirstructruby
    fi
}

alias @setuprbenv="ap_func_setup_rbenv"
ap_func_setup_rbenv() {
    # https://github.com/rbenv/rbenv
    @logshow "Install [rbenv]\n"

    # Remove old rbenv dir if any
    rm -rf "${HOME}/.rbenv"

    # Install rbenv
    git clone https://github.com/rbenv/rbenv.git "${HOME}/.rbenv"
    cd "${HOME}/.rbenv" && src/configure && make -C src

    # Prepend rbenv path to current PATH
    @addpath "${HOME}/.rbenv/bin"

    # Init rbenv
    eval "$("${HOME}/.rbenv/bin/rbenv" init - bash)"
    # eval "$(rbenv init - bash)"

    # Verify installation of rbenv
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash

    # Install ruby-build (rbenv install)
    mkdir -p "$(rbenv root)"/plugins
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

    # Install ruby
    @logshow "Install [ruby v${AP_RUBY_SETUP_VERSION}]\n"
    rbenv install "${AP_RUBY_SETUP_VERSION}"

    # Set default global ruby version
    @logshow "Set rbenv global version [${AP_RUBY_SETUP_VERSION}]\n"
    rbenv global "${AP_RUBY_SETUP_VERSION}"

    # Install gems
    @logshow "Installing [neovim, solargraph, asciidoctor]\n"
    gem install \
        neovim \
        solargraph \
        asciidoctor

    @initrbenv
    if alias @createdirstructrbenv &>/dev/null; then
        @createdirstructrbenv
    fi
}

alias @rmrbenv="ap_func_rm_rbenv"
ap_func_rm_rbenv() {
    @logshow "Remove [rbenv]\n"
    rm -rf "${HOME}/.rbenv"

    if alias @rmdirstructrbenv &>/dev/null; then
        @rmdirstructrbenv
    fi
}
