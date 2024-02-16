alias @initcommonapps="ap_func_init_common_apps"
ap_func_init_common_apps() {
    # Bash prompt
    # https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
    # https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
    export PS1_OLD="${PS1}"
    # export PS1="\[\e[95;49m\]\t \[\e[32;49m\]\w\[\e[m\]\$ "
    export PS1="\[\e[95;49m\]\t \[\e[93;49m\]\u@\h \[\e[32;49m\]\W\[\e[m\]\$ "
}

alias @setupcommonapps="ap_func_setup_common_apps"
ap_func_setup_common_apps() {
    # Require [brew]
    @logshow "Install common apps\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            brew install \
                bash-completion@2 \
                launchctl-completion \
                coreutils \
                findutils \
                make \
                cmake \
                gcc \
                gpg2 \
                gnu-sed \
                gawk \
                pandoc \
                tmux \
                unar \
                pgrep \
                poppler \
                exiftool \
                vim \
                curl \
                wget \
                git
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            port install \
                coreutils \
                findutils
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Enable necessary ubuntu software repositories
        sudo apt update
        # sudo apt install -y python-software-properties # older system
        sudo apt install -y software-properties-common

        # Add repositories
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
        sudo apt install -y \
            ppa-purge \
            apt-file \
            build-essential \
            snapd \
            cmake \
            clang \
            net-tools \
            iputils \
            curl \
            wget \
            fontconfig \
            file \
            git \
            poppler-utils \
            procps \
            htop \
            hwinfo \
            vim \
            zip \
            unzip \
            p7zip-full \
            gawk \
            gnupg2 \
            pandoc \
            nasm \
            yasm \
            bison \
            tmux \
            rsync \
            libimage-exiftool-perl \
            sysfsutils \
            dh-autoreconf

        # Install snap core
        @logshow "Install & upgrade [snap core]\n"
        sudo snap install core
        sudo snap refresh core
    fi

    @createdirstructgit
}

# common server apps
alias @setupcommonserverapps="ap_func_setup_common_server_apps"
ap_func_setup_common_server_apps() {
    @setupcommonapps
}

# common desktop apps
alias @setupcommondesktopapps="ap_func_setup_common_desktop_apps"
ap_func_setup_common_desktop_apps() {
    @setupcommonapps
    sudo apt install -y \
        sshpass

    @logshow "Install common desktop apps\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask \
            google-chrome
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # `libfuse2` should be installed only in Ubuntu >= 22.04
        # `mesa-utils` is installed for `glxinfo` command
        sudo apt install -y \
            xbindkeys \
            xautomation \
            xdotool \
            xclip \
            xsel \
            x11-utils \
            gparted \
            ibus-unikey \
            usb-creator-gtk \
            dconf-editor \
            gnome-shell-extensions \
            gnome-tweaks \
            chrome-gnome-shell \
            flatpak \
            libfuse2 \
            mesa-utils

        # Flatpak
        sudo apt install gnome-software-plugin-flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

        # Google Chrome
        cd "${AP_TMP_DIR}"
        curl -SLO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome-stable_current_amd64.deb

        # Configure ibus
        ibus-daemon -R
        ibus restart
    fi
}
