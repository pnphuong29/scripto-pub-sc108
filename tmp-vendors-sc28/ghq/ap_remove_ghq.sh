@logshow "Removing [ghq]\n"

# rm -rf "${AP_SOFT_DIR}/ghq"
if which go &>/dev/null; then
    rm -rf "$(go env GOPATH)/pkg/mod/github.com/x-motemen/ghq@"*
    rm -f "$(go env GOPATH)/bin/ghq"
fi

if ! which ghq &>/dev/null; then
    @logshowpassed "[ghq] has been removed successfully\n"
else
    @logshowfailed "[ghq] has been removed unsuccessfully\n"
fi
