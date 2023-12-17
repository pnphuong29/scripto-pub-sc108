export AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT='/var/www/nextcloud'
export AP_NEXTCLOUD_SERVER_DB_NAME='nextcloud'
export AP_NEXTCLOUD_SERVER_DB_USER='nextcloud'

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	export AP_NEXTCLOUD_SERVER_APACHE_OWNER='_www'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	export AP_NEXTCLOUD_SERVER_APACHE_OWNER='www-data'
fi

# Remove nextcloud logs directory
@logshow "Remove nextcloud logs directory [${AP_NEXTCLOUD_SERVER_LOGS_DIR}]\n"
sudo rm -rf "${AP_NEXTCLOUD_SERVER_LOGS_DIR}"

# Remove nextcloud document root
@logshow "Remove nextcloud document root [${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}]\n"
sudo rm -rf "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"

# Remove nextcloud data dir's contents
@logshow "Remove nextcloud data dir [${AP_NEXTCLOUD_SERVER_DIR}/data]\n"
sudo rm -rf "${AP_NEXTCLOUD_SERVER_DIR}/data"

# Disable site config for nextcloud
@logshow "Disable apache httpd site config for nextcloud\n"
sudo a2dissite ap_nextcloud.conf

# Remove apache httpd site config for nextcloud
@logshow "Remove apache httpd site config for nextcloud\n"
sudo rm -f /etc/apache2/sites-available/ap_nextcloud.conf

# Remove mysql database and user
@logshow "Remove mysql database and user\n"
mysql -uroot -p <<-EOF
	DROP USER IF EXISTS ${AP_NEXTCLOUD_SERVER_DB_USER}@localhost;
	DROP DATABASE IF EXISTS ${AP_NEXTCLOUD_SERVER_DB_NAME};
	FLUSH PRIVILEGES;
EOF
