alias @initruby="ap_func_init_ruby"
ap_func_init_ruby() {
    if alias @initrubyshare &>/dev/null; then
        @initrubyshare
    fi

    if alias @initrubycommon &>/dev/null; then
        @initrubycommon
    fi
}

alias @createdirstructruby="ap_func_create_dirstruct_ruby"
ap_func_create_dirstruct_ruby() {
    @logshow "Generate [ruby, gem, rails, rake, bundle] bash autocomplete\n"
    mkdir -p "${AP_SOFT_DIR}/ruby"
    cd "${AP_SOFT_DIR}/ruby"
    git clone "https://github.com/mernen/completion-ruby"

    @logshow "Create symlinks for [ruby, gem, rails, rake, bundle, jruby]\n"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-ruby" "${AP_COMPLETIONS_DIR}/ap_completion_ruby.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-gem" "${AP_COMPLETIONS_DIR}/ap_completion_gem.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-rails" "${AP_COMPLETIONS_DIR}/ap_completion_rails.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-rake" "${AP_COMPLETIONS_DIR}/ap_completion_rake.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-bundle" "${AP_COMPLETIONS_DIR}/ap_completion_bundle.bash"
    # ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-jruby" "${AP_COMPLETIONS_DIR}/ap_completion_jruby.bash"
    # ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-ruby-all" "${AP_COMPLETIONS_DIR}/ap_completion_ruby_all.bash"

    if alias @createdirstructrubyshare &>/dev/null; then
        @createdirstructrubyshare
    fi

    if alias @createdirstructrubycommon &>/dev/null; then
        @createdirstructrubycommon
    fi
}

alias @rmdirstructruby="ap_func_rm_dirstruct_ruby"
ap_func_rm_dirstruct_ruby() {
    @logshow "Remove directories [${AP_SOFT_DIR}/ruby]\n"
    rm -rf "${AP_SOFT_DIR}/ruby"

    @logshow "Remove bash completions for [ruby, gem, rails, rake, bundle, jruby]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ruby.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_gem.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rails.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rake.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_bundle.bash"
    # rm -f "${AP_COMPLETIONS_DIR}/ap_completion_jruby.bash"
    # rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ruby_all.bash"

    if alias @rmdirstructrubyshare &>/dev/null; then
        @rmdirstructrubyshare
    fi

    if alias @rmdirstructrubycommon &>/dev/null; then
        @rmdirstructrubycommon
    fi
}