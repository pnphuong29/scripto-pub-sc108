if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Installing [ppa-purge, apt-file, locales, build-essential, net-tools, iputils, make, procps, apt-file, vim, wget, unzip, gawk, gsed, gnupg2, pandoc, poppler-utils, dh-autoreconf, nasm, yasm, bison, htop, flatpak, libfuse2, p7zip-full, rsync, libimage-exiftool-perl, sysfsutils, mesa-utils] using [apt]\n"

    # Enable necessary ubuntu software repositories
    sudo apt update
    sudo apt install -y software-properties-common

    sudo add-apt-repository --yes "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
    sudo add-apt-repository --yes universe ppa:ubuntu/ppa
    sudo apt update

    # Install locales
    @logshow "Install [locales] using [apt]\n"
    sudo apt install -y locales
    echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
    echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
    echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
    sudo locale-gen en_US.UTF-8

    # Install common apps
    # `libfuse2` should be installed only in Ubuntu >= 22.04
    sudo apt install -y \
        ppa-purge \
        apt-file \
        build-essential \
        gcc \
        make \
        cmake \
        snapd \
        net-tools \
        curl \
        gawk \
        file \
        git \
        iputils \
        xbindkeys \
        poppler-utils \
        procps \
        hwinfo \
        vim \
        wget \
        unzip \
        gawk \
        gnupg2 \
        pandoc \
        nasm \
        yasm \
        bison \
        htop \
        rsync \
        tmux \
        p7zip-full \
        rsync \
        libimage-exiftool-perl \
        sysfsutils \
        dh-autoreconf \
        flatpak \
        libfuse2

    # Install snap core
    @logshow "Install & upgrade [snap core]\n"
    sudo snap install core
    sudo snap refresh core
fi

# Install git autocomplete
if [[ ! -f "${AP_COMPLETIONS_DIR}/ap_completion_git.bash" ]]; then
    @logshow "Installing [git completion]\n"
    curl -L "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"

    if [[ -f "${AP_COMPLETIONS_DIR}/ap_completion_git.bash" ]]; then
        @logshowpassed "[git completion] has been installed successfully\n"
    else
        @logshowfailed "[git completion] has been installed unsuccessfully\n"
    fi
fi
