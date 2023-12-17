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
	@addpath "${AP_VENDORS_EXA_DIR}/target/release"
else
	export AP_VENDORS_EXA_DIR="${AP_SOFT_DIR}/exa"
	@addpath "${AP_VENDORS_EXA_DIR}/bin"
fi

# Autocomplete
if [[ "${USER}" != 'root' ]]; then
	source "${AP_COMPLETIONS_DIR}/ap_completion_exa.bash"
fi

# Aliases
alias viexaconfigs="vi ${AP_VENDORS_RUST_EXA_SETUP_DIR}/ap_init_rust_exa.sh"
alias @exa="exa -a --long --header --icons --group --group-directories-first"
alias l="@exa --all"
alias @ld="@exa --all -D"
alias l2="@exa --tree --level 2"
alias ld2="@exa --tree --level 2 -D"
alias l3="@exa --tree --level 3"
alias ld3="@exa --tree --level 3 -D"
alias lg="@exa --all --git"
