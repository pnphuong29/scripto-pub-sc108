# https://github.com/rbenv/rbenv
# Dependencies: ghq

export AP_VENDORS_RUBY_RBENV_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ruby-rbenv"
export AP_VENDORS_RUBY_RBENV_SETUP_CONFIGS_DIR="${AP_VENDORS_RUBY_RBENV_SETUP_DIR}/configs"
export AP_VENDORS_RUBY_RBENV_REPO_URL="https://github.com/mernen/completion-ruby"
export AP_VENDORS_RUBY_RBENV_GH_DIR="${AP_GH_DIR}/mernen/completion-ruby"

if ! type rbenv &>/dev/null; then
    @logshow "Installing [rbenv]\n"

    # Remove old rbenv dir if any
    rm -rf ~/.rbenv

    # Install rbenv
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd ~/.rbenv && src/configure && make -C src

    # Prepend rbenv path to current PATH
    @addpath "${HOME}/.rbenv/bin"

    # Init rbenv
    eval "$(rbenv init - bash)"

    # Install ruby-build (rbenv install)
    mkdir -p "$(rbenv root)"/plugins
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

    # Install validation
    if type rbenv &>/dev/null; then
        @logshowpassed "[rbenv] has been installed successfully\n"
    else
        @logshowfailed "[rbenv] has been installed unsuccessfully\n"
    fi

    # Install ruby
    ap_var_ruby_version='3.0.4'
    @logshow "Installing [ruby v${ap_var_ruby_version}] using [rbenv]\n"
    rbenv install "${ap_var_ruby_version}"

    # Set default global ruby version
    rbenv global "${ap_var_ruby_version}"

    ruby --version | grep "ruby ${ap_var_ruby_version}" &>/dev/null
    if [[ "$?" == 0 ]]; then
        @logshowpassed "[ruby v${ap_var_ruby_version}] has been installed successfully\n"
    else
        @logshowfailed "[ruby v${ap_var_ruby_version}] has been installed unsuccessfully\n"
    fi

    # Install bash completions
    ghq get "${AP_VENDORS_RUBY_RBENV_REPO_URL}"

    # Install neovim
    gem install neovim

    # Install solargraph
    @logshow "Installing [solargraph]\n"
    gem install solargraph

    if type solargraph &>/dev/null; then
        @logshowpassed "[solargraph] has been installed successfully\n"
    else
        @logshowfailed "[solargraph] has been installed unsuccessfully\n"
    fi

    # Install asciidoctor
    @logshow "Installing [asciidoctor]\n"
    gem install asciidoctor

    if type asciidoctor &>/dev/null; then
        @logshowpassed "[asciidoctor] has been installed successfully\n"
    else
        @logshowfailed "[asciidoctor] has been installed unsuccessfully\n"
    fi
fi
