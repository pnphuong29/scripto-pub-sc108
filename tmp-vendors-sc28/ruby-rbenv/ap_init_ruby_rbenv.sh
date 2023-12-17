# https://github.com/rbenv/rbenv

export AP_VENDORS_RUBY_RBENV_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ruby-rbenv"
export AP_VENDORS_RUBY_RBENV_SETUP_CONFIGS_DIR="${AP_VENDORS_RUBY_RBENV_SETUP_DIR}/configs"
export AP_VENDORS_RUBY_RBENV_REPO_URL="https://github.com/mernen/completion-ruby"
export AP_VENDORS_RUBY_RBENV_GH_DIR="${AP_GH_DIR}/mernen/completion-ruby"

@addpath "${HOME}/.rbenv/bin"
eval "$(rbenv init - bash)"

# Autocomplete
source "${AP_VENDORS_RUBY_RBENV_GH_DIR}/completion-ruby"
source "${AP_VENDORS_RUBY_RBENV_GH_DIR}/completion-gem"
source "${AP_VENDORS_RUBY_RBENV_GH_DIR}/completion-rails"
source "${AP_VENDORS_RUBY_RBENV_GH_DIR}/completion-rake"
source "${AP_VENDORS_RUBY_RBENV_GH_DIR}/completion-bundle"
# source "${AP_VENDORS_RUBY_RBENV_GH_DIR}/completion-jruby"
# source "${AP_VENDORS_RUBY_RBENV_GH_DIR}/completion-ruby-all"

# @$alias $$ ap_func_rbenv_verify_installation {
alias ap_alias_rbenv_verify_installation='ap_func_rbenv_verify_installation'
alias rbenv_verify_installation='ap_func_rbenv_verify_installation'
# }

# @$func $$ ap_func_rbenv_verify_installation {
# ap_func_rbenv_verify_installation
# Description
# 	Verify installation of rbenv
# 	You should run this function one time after setting up rbenv
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_rbenv_verify_installation() {
	curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash
	@rtn_success
}

# @$alias $$ ap_func_ruby_generate_bash_completions {
alias ap_alias_ruby_generate_bash_completions='ap_func_ruby_generate_bash_completions'
alias rbgenerate_bash_completions='ap_func_ruby_generate_bash_completions'
# }

# @$func $$ ap_func_ruby_generate_bash_completions {
# ap_func_ruby_generate_bash_completions
# Description
# 	Generate bash completion for ruby command
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_ruby_generate_bash_completions() {
	ghq get "${AP_VENDORS_RUBY_RBENV_REPO_URL}"
	@rtn_success
}
