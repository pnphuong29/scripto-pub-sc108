alias @initgit="ap_func_init_git"
ap_func_init_git() {
    export AP_GIT_COMMIT_MSG="Auto commit"
    export AP_GIT_COMMIT_FILE="commit_msg.md"

    # When set to "1", do not include "DWIM" suggestions in git-checkout
    # and git-switch completion (e.g., completing "foo" when "origin/foo"
    # exists).
    # export GIT_COMPLETION_CHECKOUT_NO_GUESS=0

    # When set to "1" suggest all commands, including plumbing commands
    # which are hidden by default (e.g. "cat-file" on "git ca<TAB>").
    export GIT_COMPLETION_SHOW_ALL_COMMANDS=1

    # When set to "1" suggest all options, including options which are
    # typically hidden (e.g. '--allow-empty' for 'git commit').
    export GIT_COMPLETION_SHOW_ALL=1

    alias @gst="git status"
    alias @gc="git commit"
    alias @gps="git push"
    alias @gpl="git pull"
    alias @ga="git add ."
    alias @gacp="git add .; git commit -m \"\${AP_GIT_COMMIT_MSG}\"; git push"
    alias @gacpf="git add .; git commit --file=\"\${AP_GIT_COMMIT_FILE}\"; git push"
    alias @gl="git log --all --oneline --graph --decorate"
    alias @glt="git ls-tree -r -t --full-tree --full-name --abbrev --long"
    alias @gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
    alias @gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
    alias @gd="git --no-pager diff --name-status"
    alias @gshow="git --no-pager show --abbrev-commit --name-status"
    alias @gcf="git commit --file=\${AP_GIT_COMMIT_FILE}"
}

alias @gengitcompletion="ap_func_generate_git_autocomplete"
ap_func_generate_git_autocomplete() {
    @logshow "Generate [git] bash autocomplete\n"
    curl -L "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"
}
