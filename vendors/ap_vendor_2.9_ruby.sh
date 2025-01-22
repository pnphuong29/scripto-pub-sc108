alias apinitruby="ap_func_init_ruby"
ap_func_init_ruby() {
    export AP_RUBY_VERSION_3="3.1.4"
    export AP_RUBY_VERSION_DEFAULT="${AP_RUBY_VERSION_3}"

    if alias apinitrubyshare &>/dev/null; then
        apinitrubyshare
    fi

    if alias apinitrubycommon &>/dev/null; then
        apinitrubycommon
    fi
}

alias apcreatedirstructruby="ap_func_create_dirstruct_ruby"
ap_func_create_dirstruct_ruby() {
    aplogshow "Generate [ruby, gem, rails, rake, bundle] bash autocomplete\n"
    mkdir -p "${AP_SOFT_DIR}/ruby"
    cd "${AP_SOFT_DIR}/ruby"
    git clone "https://github.com/mernen/completion-ruby"

    aplogshow "Create symlinks for [ruby, gem, rails, rake, bundle, jruby] completions\n"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-ruby" "${AP_COMPLETIONS_DIR}/ap_completion_ruby.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-gem" "${AP_COMPLETIONS_DIR}/ap_completion_gem.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-rails" "${AP_COMPLETIONS_DIR}/ap_completion_rails.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-rake" "${AP_COMPLETIONS_DIR}/ap_completion_rake.bash"
    ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-bundle" "${AP_COMPLETIONS_DIR}/ap_completion_bundle.bash"
    # ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-jruby" "${AP_COMPLETIONS_DIR}/ap_completion_jruby.bash"
    # ln -sf "${AP_SOFT_DIR}/ruby/completion-ruby/completion-ruby-all" "${AP_COMPLETIONS_DIR}/ap_completion_ruby_all.bash"

    if alias apcreatedirstructrubyshare &>/dev/null; then
        apcreatedirstructrubyshare
    fi

    if alias apcreatedirstructrubycommon &>/dev/null; then
        apcreatedirstructrubycommon
    fi
}

alias aprmdirstructruby="ap_func_rm_dirstruct_ruby"
ap_func_rm_dirstruct_ruby() {
    aplogshow "Remove directories [${AP_SOFT_DIR}/ruby]\n"
    rm -rf "${AP_SOFT_DIR}/ruby"

    aplogshow "Remove bash completions for [ruby, gem, rails, rake, bundle, jruby]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ruby.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_gem.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rails.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rake.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_bundle.bash"
    # rm -f "${AP_COMPLETIONS_DIR}/ap_completion_jruby.bash"
    # rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ruby_all.bash"

    if alias aprmdirstructrubyshare &>/dev/null; then
        aprmdirstructrubyshare
    fi

    if alias aprmdirstructrubycommon &>/dev/null; then
        aprmdirstructrubycommon
    fi
}
