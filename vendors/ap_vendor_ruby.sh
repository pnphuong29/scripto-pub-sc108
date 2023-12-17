alias @genrubycompletion="ap_func_generate_ruby_autocomplete"
ap_func_generate_ruby_autocomplete() {
    @logshow "Generate [ruby, gem, rails, rake, bundle] bash autocomplete\n"
    mkdir -p "${AP_GH_DIR}/mernen"
    cd "${AP_GH_DIR}/mernen"
    git clone "https://github.com/mernen/completion-ruby"

    @logshow "Create symlinks for [ruby, gem, rails, rake, bundle, jruby]\n"
    ln -sf "${AP_GH_DIR}/mernen/completion-ruby/completion-ruby" "${AP_COMPLETIONS_DIR}/ap_completion_ruby.bash"
    ln -sf "${AP_GH_DIR}/mernen/completion-ruby/completion-gem" "${AP_COMPLETIONS_DIR}/ap_completion_gem.bash"
    ln -sf "${AP_GH_DIR}/mernen/completion-ruby/completion-rails" "${AP_COMPLETIONS_DIR}/ap_completion_rails.bash"
    ln -sf "${AP_GH_DIR}/mernen/completion-ruby/completion-rake" "${AP_COMPLETIONS_DIR}/ap_completion_rake.bash"
    ln -sf "${AP_GH_DIR}/mernen/completion-ruby/completion-bundle" "${AP_COMPLETIONS_DIR}/ap_completion_bundle.bash"
    # ln -sf "${AP_GH_DIR}/mernen/completion-ruby/completion-jruby" "${AP_COMPLETIONS_DIR}/ap_completion_jruby.bash"
    # ln -sf "${AP_GH_DIR}/mernen/completion-ruby/completion-ruby-all" "${AP_COMPLETIONS_DIR}/ap_completion_ruby_all.bash"
}
