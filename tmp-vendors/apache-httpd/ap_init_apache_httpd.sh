# It's recommended to use `apachectl` command to control apache instead of using `apache2`
# If you want to execute `apache2` command with some options such as `-M, -T, etc.`
# You must set predefined apache variables as followings
# if [[ -f /etc/apache2/envvars ]]; then
# 	ap_g_home_bk="${HOME}" # backup $HOME env variable
# 	source /etc/apache2/envvars
# 	export HOME="${ap_g_home_bk}" # restore $HOME env variable
# fi

export AP_APACHE_HTTPD_ROTATELOGS_FILE_PATH="$(type rotatelogs | cut -d ' ' -f 3)"
