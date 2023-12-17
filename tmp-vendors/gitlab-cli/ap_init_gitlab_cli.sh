export AP_GITLAB_P29_PREFIX='p29-gitlab'

[ -s "${AP_SECRETS_DIR}/ap_pnphuong29_gitlab.token" ] && export GITLAB_TOKEN="$(cat "${AP_SECRETS_DIR}/ap_pnphuong29_gitlab.token")"

# source <(glab completion --shell bash)
