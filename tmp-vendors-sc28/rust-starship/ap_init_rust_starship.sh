# https://starship.rs/config/

export AP_VENDORS_RUST_STARSHIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-starship"
export AP_VENDORS_RUST_STARSHIP_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_STARSHIP_SETUP_DIR}/configs"
export AP_VENDORS_RUST_STARSHIP_REPO_URL="https://github.com/starship/starship"
export AP_VENDORS_RUST_STARSHIP_GH_DIR="${AP_GH_DIR}/starship/starship"

eval "$(starship init bash)"
