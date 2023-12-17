# https://github.com/neovim/neovim/wiki/Installing-Neovim
# https://neovim.io/doc/user/provider.html
# https://github.com/junegunn/vim-plug
# Dependencies: python3, gem, npm
# Installed packages: neovim, vim-plug, coc-extensions

# Notes
# - All coc extensions will be installed when openning neovim first time
# - After finishing installing plugins and coc extensions, you should run `:checkhealh` in neovim

export AP_VENDORS_NVIM_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nvim"
export AP_VENDORS_NVIM_SETUP_CONFIGS_DIR="${AP_VENDORS_NVIM_SETUP_DIR}/configs"
export AP_VENDORS_NVIM_REPO_URL="https://github.com/neovim/neovim"
export AP_VENDORS_NVIM_DIR="${AP_SOFT_DIR}/nvim"
# export AP_NVIM_VERSION="stable"
export AP_NVIM_VERSION="latest"

@logshow "Installing [nvim] using precompiled binary package\n"

# Remove old nvim dir
rm -rf "${AP_VENDORS_NVIM_DIR}"

# Install nvim
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    # curl -L "${AP_VENDORS_NVIM_REPO_URL}/releases/download/${AP_NVIM_VERSION}/{nvim-macos.tar.gz}" -o "${AP_TMP_DIR}/#1"
    curl -L "${AP_VENDORS_NVIM_REPO_URL}/releases/${AP_NVIM_VERSION}/download/{nvim-macos.tar.gz}" -o "${AP_TMP_DIR}/#1"
    tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/nvim-macos.tar.gz"
    mv "${AP_VENDORS_NVIM_DIR}-macos" "${AP_VENDORS_NVIM_DIR}"
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    # [Optional] Install vim (if missing on linux)
    if ! type vim &>/dev/null; then
        @logshow "Installing [vim] using [apt]\n"
        sudo apt update
        sudo apt install -y vim
    fi

    # Using apt to install nvim
    # sudo apt-get install python-dev python-pip python3-dev python3-pip # Require python (use pyenv to install)
    # sudo add-apt-repository ppa:neovim-ppa/stable
    # sudo apt-get update
    # sudo apt-get install neovim

    # curl -L "${AP_VENDORS_NVIM_REPO_URL}/releases/download/${AP_NVIM_VERSION}/{nvim-linux64.tar.gz}" -o "${AP_TMP_DIR}/#1"
    curl -L "${AP_VENDORS_NVIM_REPO_URL}/releases/${AP_NVIM_VERSION}/download/{nvim-linux64.tar.gz}" -o "${AP_TMP_DIR}/#1"
    tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/nvim-linux64.tar.gz"
    mv "${AP_VENDORS_NVIM_DIR}-linux64" "${AP_VENDORS_NVIM_DIR}"
fi

# Update PATH
@addpath "${AP_VENDORS_NVIM_DIR}/bin"

@logshow "Make symbolic link to nvim in /usr/local/bin\n"
sudo ln -sf "${AP_VENDORS_NVIM_DIR}/bin/nvim" /usr/local/bin/nvim

# Install Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Create symlink
ln -sf "${AP_VENDORS_NVIM_SETUP_CONFIGS_DIR}/ap_nvim_init.conf.vim" "${AP_SYMLINKS_DIR}/init.vim"
ln -sf "$(which python3)" "${AP_SYMLINKS_DIR}/python3"

# Install client providers for neovim
pip install --upgrade pynvim
gem install neovim
npm install -g neovim

# Configure init.vim
mkdir -p "${HOME}/.config/nvim"
echo "source ${AP_SYMLINKS_DIR}/init.vim" >"${HOME}/.config/nvim/init.vim"

# Install plugins using vim-plug
nvim "+:call PlugInstallAndExit()"

# Setup validation
if type nvim &>/dev/null; then
    @logshowpassed "[nvim] has been installed successfully\n"
else
    @logshowfailed "[nvim] has been installed unsuccessfully\n"
fi
