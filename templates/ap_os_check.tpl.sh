if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    if [[ "$(uname -m)" == 'arm64' ]]; then

    elif [[ "$(uname -m)" == 'x86_64' ]]; then

    fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then

else

fi
