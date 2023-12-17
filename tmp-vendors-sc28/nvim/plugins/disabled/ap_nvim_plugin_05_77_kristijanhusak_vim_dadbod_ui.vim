" https://github.com/kristijanhusak/vim-dadbod-ui

let g:db_ui_save_location = $AP_PRJ_SCRIPTS_DIR . '/data/ap_vim_dadbod_ui_queries.sql'

let g:dbs = [
\ { 'name': 'pg-local', 'url': 'postgres://' . $AP_PG_LOCAL_USER . ':' . $AP_PG_LOCAL_PASS . '@localhost:' . $AP_PG_LOCAL_PORT . '/' . $AP_PG_LOCAL_DB_NAME },
\ { 'name': $AP_DK_PG1_NAME, 'url': 'postgres://' . $AP_DK_PG1_USER . ':' . $AP_DK_PG1_PASS . '@localhost:' . $AP_DK_PG1_PORT_HOST . '/' . $AP_DK_PG1_DB_NAME },
\ ]
