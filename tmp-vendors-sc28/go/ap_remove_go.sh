@logshow "Removing [go]\n"

# Remove go libraries
rm -rf "$(go env GOPATH)"

# Remove main go dir
rm -rf "$(go env GOROOT)"

if ! type go &>/dev/null; then
    @logshowpassed "[go] has been removed successfully\n"
else
    @logshowfailed "[go] has been removed unsuccessfully\n"
fi
