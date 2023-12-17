alias @initrbenv="ap_func_init_rbenv"
ap_func_init_rbenv() {
    # https://github.com/rbenv/rbenv
    export AP_RUBY_SETUP_VERSION="3.2.2"
    @addpath "${HOME}/.rbenv/bin"
    eval "$(rbenv init - bash)"
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
    eval "$(rbenv init - bash)"

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

    @genrubycompletion
    @createdirstructrbenv
}

alias @rmrbenv="ap_func_remove_rbenv"
ap_func_remove_rbenv() {
    # https://github.com/rbenv/rbenv
    @logshow "Remove [rbenv]\n"
    rm -rf "${HOME}/.rbenv"
    rm -rf "${AP_GH_DIR}/mernen/completion-ruby"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ruby.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_gem.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rails.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rake.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_bundle.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_jruby.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ruby_all.bash"
}
