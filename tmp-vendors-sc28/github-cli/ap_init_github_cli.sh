if [ -s "${AP_SECRETS_DIR}/ap_pnphuong29_github.token" ]; then
    export GITHUB_TOKEN="$(cat "${AP_SECRETS_DIR}/ap_pnphuong29_github.token")"
fi

# Autocomplete
eval "$(gh completion --shell bash)"

export AP_VENDORS_GH_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/github-cli"
alias viscghconfigs="vi ${AP_VENDORS_GH_DIR}/ap_init_github_cli.sh"

alias lsghrepos='gh repo list --limit 200'

# @$alias $$ ap_func_gh_repo_create {
alias ap_alias_gh_repo_create='ap_func_gh_repo_create'
alias newghrepo='ap_func_gh_repo_create'
# }

# @$func $$ ap_func_gh_repo_create {
# ap_func_gh_repo_create <repo_name>
# Descriptions
# 	Execute GitHub repo create command
# Return Status
# 	0: Success
# 	1: Missing repo name
# }

ap_func_gh_repo_create() {
    local ap_repo_name="$1"

    if [ -z "${ap_repo_name}:-" ]; then
        echo "Missing repo name"
        return 1
    fi

    gh repo create --private "${ap_repo_name}"
    gcl "${ap_repo_name}"

    return 0
}

# @$alias $$ ap_func_gh_repo_rename {
alias ap_alias_gh_repo_rename='ap_func_gh_repo_rename'
alias mvghrepo='ap_func_gh_repo_rename'
# }

# @$func $$ ap_func_gh_repo_rename {
# ap_func_gh_repo_rename <new_repo_name>
# Descriptions
# 	Execute GitHub repo rename command
# Return Status
# 	0: Success
# 	1: Missing new repo name
# }

ap_func_gh_repo_rename() {
    local ap_new_repo_name="$1"

    if [ -z "${ap_new_repo_name}:-" ]; then
        echo "Missing new repo name"
        return 1
    fi

    # Update GitHub repo to new name
    gh repo rename --yes "${ap_new_repo_name}"
    git remote set-url origin "git@${AP_GITHUB_P29_PREFIX}:pnphuong29/${ap_new_repo_name}.git"

    return 0
}

# @$alias $$ ap_func_gh_repo {
alias ap_alias_gh_repo="ap_func_gh_repo"
alias @gh="ap_alias_gh_repo"
# }

# @$func $$ ap_func_gh_repo {
# ap_func_gh_repo <sub-command> [params]
# Descriptions
# 	Util functions for executing GitHub CLI repo sub-commands
#	Sub-commands
#		create <repo_name>
#		rename <new_name>
# Return Status
# 	0: Success
# 	1: Missing sub command
# 	2: Invalid command
# }

ap_func_gh_repo() {
    local ap_sub_cmd="$1"

    if [ -z "${ap_sub_cmd}:-" ]; then
        echo "Missing sub command"
        return 1
    fi

    shift

    case "${ap_sub_cmd}" in
    create)
        ap_alias_gh_repo_create "$@"
        ;;
    rename)
        ap_alias_gh_repo_rename "$@"
        ;;
    *)
        echo "Invalid command <${ap_sub_cmd}>"
        return 2
        ;;
    esac

    return 0
}
