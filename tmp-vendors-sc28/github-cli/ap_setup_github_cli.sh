# https://github.com/cli/cli#installation

@logshow "Installing [GitHub CLI]\n"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    brew install gh
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
    sudo apt update
    sudo apt install -y gh
fi

if type gh &>/dev/null; then
    @logshowpassed "[GitHub CLI] has been installed successfully\n"
else
    @logshowfailed "[GitHub CLI] has been installed unsuccessfully\n"
fi

pip install gitsome
