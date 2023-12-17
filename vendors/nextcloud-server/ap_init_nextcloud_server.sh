# https://docs.nextcloud.com/server/stable/admin_manual/installation/source_installation.html
# https://docs.nextcloud.com/server/stable/admin_manual/installation/example_ubuntu.html
# https://github.com/nextcloud/server
# https://docs.nextcloud.com/server/stable/admin_manual/installation/source_installation.html#pretty-urls

export AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nextcloud-server"
export AP_VENDORS_NEXTCLOUD_SERVER_SETUP_CONFIGS_DIR="${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs"
export AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT='/var/www/nextcloud'
export AP_NEXTCLOUD_SERVER_CONFIG_FILE="${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}/config/config.php"
export AP_NEXTCLOUD_SERVER_DB_TYPE='mysql'
export AP_NEXTCLOUD_SERVER_DB_NAME='nextcloud'
export AP_NEXTCLOUD_SERVER_DB_USER='nextcloud'
export AP_NEXTCLOUD_USER_ADMIN='pnphuong29'

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    export AP_NEXTCLOUD_SERVER_APACHE_OWNER='_www'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    export AP_NEXTCLOUD_SERVER_APACHE_OWNER='www-data'
fi

alias vincserver="@vi -p \
	${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/ap_init_nextcloud_server.sh \
	${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_CONFIGS_DIR}/ap_my.cnf \
	${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_CONFIGS_DIR}/ap_redis.conf \
	${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_CONFIGS_DIR}/ap_php.ini \
	${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_CONFIGS_DIR}/ap_apache_httpd_nextcloud.conf"

alias bkncdata="rsync -Aavx ${AP_NEXTCLOUD_SERVER_DIR}/data/ ${AP_NEXTCLOUD_SERVER_DIR}/data_$(gdate +"%Y%m%d_%H%M%S")/" # Backup Nextcloud data in host machine
alias zncserverdata="cd ${AP_DATA1_DIR}/nextcloud"
alias showncaiopasswd="sudo docker exec nextcloud-aio-mastercontainer grep password /mnt/docker-aio-config/data/configuration.json"

# Below aliases should be used only in vagrant machine
## START---
alias occ='sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"/occ'
alias occupdatehtaccess='sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"/occ maintenance:update:htaccess'

# https://docs.nextcloud.com/server/latest/admin_manual/maintenance/backup.html#maintenance-mode
alias occenablemaintenancemode='sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"/occ maintenance:mode --on'
alias occdisablemaintenancemode='sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"/occ maintenance:mode --off'

alias zncdocroot='cd "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"'

# Backup Nextcloud DB in guest machine
alias ncbkdb='occenablemaintenancemode; mysqldump -uroot "${AP_NEXTCLOUD_SERVER_DB_NAME}" >"${AP_TMP_DIR}/nc.sql"; sudo mv "${AP_TMP_DIR}/nc.sql" "${AP_NEXTCLOUD_SERVER_DIR}/db/ap_db_nextcloud_$(gdate +"%Y%m%d_%H%M%S").sql"; occdisablemaintenancemode'

alias ncbkmysqldata="sudo rm -rf ${AP_NEXTCLOUD_SERVER_MYSQL_DIR}; sudo cp -R --preserve=all /var/lib/mysql/. ${AP_NEXTCLOUD_SERVER_MYSQL_DIR}/"

# Restore Nextcloud DB in guest machine
alias ncrtdb='occenablemaintenancemode; mysql -uroot -p "${AP_NEXTCLOUD_SERVER_DB_NAME}" <"${AP_NEXTCLOUD_SERVER_DIR}/db/ap_db_nextcloud.sql"; occdisablemaintenancemode'
## END---

# Backup Nextcloud DB from host machine
alias bkncdb="cd \${AP_SC28_VAGRANT_VMS_DIR}/vg-nextcloud; vagrant ssh -c /home/vagrant/scripto/projects/p29-github/pnphuong29/ap-scripts-nextcloud-sc56/utils/ap_bk_nextcloud_db.sh"

# Backup Nextcloud source codes, data and DB
alias bkncall="gacpnc7; bkncdata; bkncdb"

# Restore Nextcloud DB from host machine
alias rtncdb="cd \${AP_SC28_VAGRANT_VMS_DIR}/vg-nextcloud; vagrant ssh -c /home/vagrant/scripto/projects/p29-github/pnphuong29/ap-scripts-nextcloud-sc56/utils/ap_rt_nextcloud_db.sh"

# @$alias $$ ap_func_nextcloud_backup {
alias ap_alias_nextcloud_backup='ap_func_nextcloud_backup'
alias bkncvm='ap_func_nextcloud_backup'
# }

# @$func $$ ap_func_nextcloud_backup {
# ap_func_nextcloud_backup
# Description
# 	Backup nextcloud vagrant machine
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_backup() {
    cd "${AP_VMS_DIR}/vm-images/vagrant"
    boxName="vagrant_nextcloud_$(gdate +"%Y%m%d").box"
    vagrantMachineId="$(vagrant global-status | grep nextcloud | cut -d " " -f 1)"
    # echo "Box Name = ${boxName} and Machine ID = ${vagrantMachineId}"
    vagrant package --output "${boxName}" -- "${vagrantMachineId}"
    @rtn_success
}

# @$alias $$ ap_func_nextcloud_download {
alias ap_alias_nextcloud_download='ap_func_nextcloud_download'
# }

# @$func $$ ap_func_nextcloud_download {
# ap_func_nextcloud_download
# Description
# 	Download and uncompress nextcloud into <AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT>
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_download() {
    ## Download nextcloud
    @minfo "Download nextcloud\n"
    cd "${AP_TMP_DIR}"
    rm -f latest.tar.bz2
    curl -SLO "https://download.nextcloud.com/server/releases/latest.tar.bz2"

    ## Checksum
    @minfo "Verify checksum using md5\n"
    curl -SLO "https://download.nextcloud.com/server/releases/latest.tar.bz2.md5"
    md5 -c latest.tar.bz2.md5 <latest.tar.bz2

    ## Verify authenticity
    @minfo "Verify authenticity\n"
    curl -SLO "https://download.nextcloud.com/server/releases/latest.tar.bz2.asc"
    curl -SLO "https://nextcloud.com/nextcloud.asc"
    gpg --import nextcloud.asc
    gpg --verify latest.tar.bz2.asc latest.tar.bz2

    ## Uncompress nextcloud
    @minfo "Uncompress and copy nextcloud to [${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}]\n"
    rm -rf "${AP_TMP_DIR}/nextcloud"
    tar -jxf latest.tar.bz2
    sudo rsync -ahP nextcloud/ "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}/"

    @rtn_success
}

# @$alias $$ ap_func_nextcloud_install {
alias ap_alias_nextcloud_install='ap_func_nextcloud_install'
# }

# @$alias $$ ap_func_nextcloud_setup_mysql_db {
alias ap_alias_nextcloud_setup_mysql_db='ap_func_nextcloud_setup_mysql_db'
# }

# @$func $$ ap_func_nextcloud_setup_mysql_db {
# ap_func_nextcloud_setup_mysql_db
# Description
# 	Create mysql db and user for nextcloud
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_setup_mysql_db() {
    @minfo "Creating mysql db and user for nextcloud\n"

    if [[ -z "${AP_NEXTCLOUD_SERVER_DB_PASSWD}" ]]; then
        echo "DB password cannot be empty!"
        ap_alias_rtn_missing_info
    fi

    # https://dev.mysql.com/doc/refman/8.0/en/set-transaction.html
    # https://dev.mysql.com/doc/refman/8.0/en/innodb-transaction-isolation-levels.html#isolevel_read-committed
    mysql -uroot -p <<-EOF
		CREATE USER IF NOT EXISTS ${AP_NEXTCLOUD_SERVER_DB_USER}@localhost IDENTIFIED WITH mysql_native_password BY '${AP_NEXTCLOUD_SERVER_DB_PASSWD}';
		CREATE DATABASE IF NOT EXISTS ${AP_NEXTCLOUD_SERVER_DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
		GRANT ALL ON ${AP_NEXTCLOUD_SERVER_DB_NAME}.* TO ${AP_NEXTCLOUD_SERVER_DB_USER}@localhost;
		SET GLOBAL TRANSACTION ISOLATION LEVEL READ COMMITTED;
		FLUSH PRIVILEGES;
	EOF

    @rtn_success
}

# @$alias $$ ap_func_nextcloud_remove_mysql_db {
alias ap_alias_nextcloud_remove_mysql_db='ap_func_nextcloud_remove_mysql_db'
# }

# @$func $$ ap_func_nextcloud_remove_mysql_db {
# ap_func_nextcloud_remove_mysql_db
# Description
# 	Remove mysql db and user for nextcloud
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_remove_mysql_db() {
    @logshow "Remove mysql database and user\n"
    mysql -uroot -p <<-EOF
		DROP USER IF EXISTS ${AP_NEXTCLOUD_SERVER_DB_USER}@localhost;
		DROP DATABASE IF EXISTS ${AP_NEXTCLOUD_SERVER_DB_NAME};
		SET GLOBAL ISOLATION LEVEL REPEATABLE READ;
		FLUSH PRIVILEGES;
	EOF

    @rtn_success
}

# @$alias $$ ap_func_nextcloud_configure_mysql {
alias ap_alias_nextcloud_configure_mysql='ap_func_nextcloud_configure_mysql'
# }

# @$func $$ ap_func_nextcloud_configure_mysql {
# ap_func_nextcloud_configure_mysql
# Description
# 	Configure MySQL server for running Nextcloud
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_configure_mysql() {
    # Add custom config file
    @minfo "Adding custom config file [ap_my.cnf] to [/etc/mysql/mysql.conf.d] directory\n"
    sudo cp -f "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/ap_my.cnf" /etc/mysql/mysql.conf.d/zzzzzzz.cnf # use this name to make this custom config file [zzzzzzz.cnf] to be loaded after [mysqld.cnf] file

    # Refer to this URL for guidelines
    # https://github.com/jazzfog/MySql-in-Vagrant/blob/master/provision/provision.sh
    # Add below lines at file `/etc/apparmor.d/usr.sbin.mysqld` in between /usr/bin/mysqld { ... } to allow `mysqld` to access below data dir

    # local ap_apparmor_config_file='/etc/apparmor.d/usr.sbin.mysqld'
    # if ! grep ${AP_NEXTCLOUD_SERVER_MYSQL_DIR} ${ap_apparmor_config_file}; then
    # 	sudo cp -f "${ap_apparmor_config_file}" "${ap_apparmor_config_file}.bak"
    # 	local ap_pos="$(grep -n /var/lib/mysql ${ap_apparmor_config_file} | cut -d : -f 1 | head -1)"
    # 	sudo gsed -i "${ap_pos}a  ${AP_NEXTCLOUD_SERVER_MYSQL_DIR}/** rwk," ${ap_apparmor_config_file}
    # 	sudo gsed -i "${ap_pos}a  ${AP_NEXTCLOUD_SERVER_MYSQL_DIR}/ r," ${ap_apparmor_config_file}
    # 	sudo systemctl restart apparmor
    # fi

    # Restart MySQL Server
    @logshow "Restarting MySQL server\n"
    sudo systemctl restart mysql

    @rtn_success
}

# @$alias $$ ap_func_nextcloud_configure_redis {
alias ap_alias_nextcloud_configure_redis='ap_func_nextcloud_configure_redis'
# }

# @$func $$ ap_func_nextcloud_configure_redis {
# ap_func_nextcloud_configure_redis
# Description
# 	Configure redis for running Nextcloud
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_configure_redis() {
    local ap_pos

    @minfo "Add user [${AP_NEXTCLOUD_SERVER_APACHE_OWNER}] to group [redis]\n"
    sudo usermod -a -G redis "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}"

    @minfo "Updating [/etc/redis/redis.conf] file\n"
    sudo cp /etc/redis/redis.conf /etc/redis/redis.conf.bak
    ap_pos=$(sudo grep -n "${AP_MARKER_CONFIG_START}" /etc/redis/redis.conf | head -1 | cut -d : -f 1)
    [[ -n "${ap_pos}" ]] && ap_pos=$((ap_pos - 1)) && sudo gsed -i'' "${ap_pos},$$d" /etc/redis/redis.conf
    echo | sudo tee -a /etc/redis/redis.conf
    cat "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/ap_redis.conf" | sudo tee -a /etc/redis/redis.conf

    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        # https://redis.io/docs/manual/admin/
        # Set the Linux kernel overcommit memory setting to 1
        if ! grep "vm.overcommit_memory = 1" /etc/sysctl.conf &>/dev/null; then
            @minfo "Enabling overcommit_memory in [/etc/sysctl.conf] file\n"
            sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
            echo | sudo tee -a /etc/sysctl.conf
            echo "vm.overcommit_memory = 1" | sudo tee -a /etc/sysctl.conf
        fi

        # To ensure the Linux kernel feature Transparent Huge Pages does not impact Redis memory usage and latency
        if ! grep "kernel/mm/transparent_hugepage/enabled = never" /etc/sysctl.conf &>/dev/null; then
            @minfo "Ensure the Linux kernel feature Transparent Huge Pages does not impact Redis memory usage and latency in [/etc/sysctl.conf] file\n"
            sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
            echo "kernel/mm/transparent_hugepage/enabled = never" | sudo tee -a /etc/sysctl.conf
        fi
    fi

    # Restart Redis
    @minfo "Restart Redis server\n"
    sudo systemctl restart redis-server

    @rtn_success
}

# @$alias $$ ap_func_nextcloud_configure_apache_httpd {
alias ap_alias_nextcloud_configure_apache_httpd='ap_func_nextcloud_configure_apache_httpd'
# }

# @$func $$ ap_func_nextcloud_configure_apache_httpd {
# ap_func_nextcloud_configure_apache_httpd
# Description
# 	Configure Apache Httpd for running Nextcloud
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_configure_apache_httpd() {
    # Create site config for nextcloud
    @minfo "Creating site config for nextcloud\n"
    cp -f "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/ap_apache_httpd_nextcloud.conf" "${AP_TMP_DIR}/ap_nextcloud.conf"

    gsed -i'' "s#@{AP_PORT_NEXTCLOUD}@#${AP_PORT_NEXTCLOUD}#g" "${AP_TMP_DIR}/ap_nextcloud.conf"
    gsed -i'' "s#@{AP_PORT_NEXTCLOUD_HTTPS}@#${AP_PORT_NEXTCLOUD_HTTPS}#g" "${AP_TMP_DIR}/ap_nextcloud.conf"
    gsed -i'' "s#@{AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}@#${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}#g" "${AP_TMP_DIR}/ap_nextcloud.conf"
    gsed -i'' "s#@{AP_DOMAIN_NEXTCLOUD}@#${AP_DOMAIN_NEXTCLOUD}#g" "${AP_TMP_DIR}/ap_nextcloud.conf"
    gsed -i'' "s#@{AP_NEXTCLOUD_SERVER_LOGS_DIR}@#${AP_NEXTCLOUD_SERVER_LOGS_DIR}#g" "${AP_TMP_DIR}/ap_nextcloud.conf"
    gsed -i'' "s#@{AP_APACHE_HTTPD_ROTATELOGS_FILE_PATH}@#${AP_APACHE_HTTPD_ROTATELOGS_FILE_PATH}#g" "${AP_TMP_DIR}/ap_nextcloud.conf"
    gsed -i'' "s#@{AP_VENDORS_CERTBOT_SETUP_CONFIGS_DIR}@#${AP_VENDORS_CERTBOT_SETUP_CONFIGS_DIR}#g" "${AP_TMP_DIR}/ap_nextcloud.conf"

    sudo cp -f /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak
    sudo cp -f "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/000-default.conf" /etc/apache2/sites-available/
    sudo cp -f "${AP_TMP_DIR}/ap_nextcloud.conf" /etc/apache2/sites-available/

    # Enable apache httpd site config for nextcloud
    @minfo "Enable [mod_ssl] in Apache\n"
    sudo a2enmod ssl

    # Enable apache httpd site config for nextcloud
    @minfo "Enable site config for nextcloud\n"
    sudo a2ensite ap_nextcloud.conf
    sudo a2ensite 000-default.conf

    # Add info.php to test site
    @minfo "Setup test site [/var/www/html]\n"
    sudo cp -f "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/info.php" /var/www/html/

    # Restart Apache2
    @logshow "Restarting Apache2\n"
    sudo systemctl restart apache2

    @rtn_success
}

# @$alias $$ ap_func_nextcloud_configure_php {
alias ap_alias_nextcloud_configure_php='ap_func_nextcloud_configure_php'
# }

# @$func $$ ap_func_nextcloud_configure_php {
# ap_func_nextcloud_configure_php
# Description
# 	Update php.ini configs
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_configure_php() {
    local ap_pos
    local ap_php_config_dir

    # ap_php_config_dir="$(php -i | grep "Configuration File (php.ini)" | gawk -F' ' '{print $6}')"
    # ap_php_config_dir="${ap_php_config_dir%/*}"
    ap_php_config_dir="/etc/php/8.1" # Current version of Nextcloud server does not work with PHP >= 8.2

    # Update php.ini files
    @minfo "Updating [${ap_php_config_dir}/apache2/php.ini] file\n"
    sudo cp "${ap_php_config_dir}/apache2/php.ini" "${ap_php_config_dir}/apache2/php.ini.bak"
    ap_pos=$(cat "${ap_php_config_dir}/apache2/php.ini" | grep -n "${AP_MARKER_CONFIG_START}" | head -1 | cut -d : -f 1)
    [[ -n "${ap_pos}" ]] && ap_pos=$((ap_pos - 1)) && sudo gsed -i'' "${ap_pos},$$d" "${ap_php_config_dir}/apache2/php.ini"
    echo | sudo tee -a "${ap_php_config_dir}/apache2/php.ini"
    cat "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/ap_php.ini" | sudo tee -a "${ap_php_config_dir}/apache2/php.ini"

    @minfo "Updating [${ap_php_config_dir}/cli/php.ini] file\n"
    sudo cp "${ap_php_config_dir}/cli/php.ini" "${ap_php_config_dir}/cli/php.ini.bak"
    ap_pos=$(cat "${ap_php_config_dir}/cli/php.ini" | grep -n "${AP_MARKER_CONFIG_START}" | head -1 | cut -d : -f 1)
    [[ -n "${ap_pos}" ]] && ap_pos=$((ap_pos - 1)) && sudo gsed -i'' "${ap_pos},$$d" "${ap_php_config_dir}/cli/php.ini"
    echo | sudo tee -a "${ap_php_config_dir}/cli/php.ini"
    cat "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/ap_php.ini" | sudo tee -a "${ap_php_config_dir}/cli/php.ini"

    # Restart Apache2
    @minfo "Restart Apache2\n"
    sudo service apache2 restart

    @rtn_success
}

# @$func $$ ap_func_nextcloud_install {
# ap_func_nextcloud_install
# Description
# 	Install nextcloud
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_install() {
    local ap_pos

    if [[ -z "${AP_NEXTCLOUD_SERVER_DB_PASSWD}" ]]; then
        echo "DB password cannot be empty!"
        ap_alias_rtn_error_missing_info
    fi

    @minfo "Installing nextcloud\n"
    cd "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}"
    sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php occ maintenance:install -vv \
        --database ${AP_NEXTCLOUD_SERVER_DB_TYPE} --database-name "${AP_NEXTCLOUD_SERVER_DB_NAME}" --database-user "${AP_NEXTCLOUD_SERVER_DB_USER}" --database-pass "${AP_NEXTCLOUD_SERVER_DB_PASSWD}" \
        --admin-user "${AP_NEXTCLOUD_USER_ADMIN}" --admin-pass "${AP_NEXTCLOUD_USER_ADMIN}" \
        --data-dir "${AP_NEXTCLOUD_SERVER_DIR}/data"

    # Configure nextcloud
    @logshow "Configure nextcloud\n"
    sudo cp -f "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}" "${AP_TMP_DIR}/ap_nextcloud_config.php"
    sudo chown "${USER}.${USER}" "${AP_TMP_DIR}/ap_nextcloud_config.php"

    ## Configure trusted domain
    ap_pos=$(sudo grep -n trusted_domains "${AP_TMP_DIR}/ap_nextcloud_config.php" | head -1 | cut -d ':' -f 1)
    ap_pos=$((ap_pos + 2))
    gsed -i'' "${ap_pos}a1 => '$AP_DOMAIN_NEXTCLOUD'" "${AP_TMP_DIR}/ap_nextcloud_config.php"

    ## Configure pretty URLs
    ap_g_nc_tmp="$(echo "${AP_URL_NEXTCLOUD}" | gsed 's@\.@\\\.@g')"
    gsed -i'' -E "s@('overwrite\.cli\.url') => '.+',@\1 => '${ap_g_nc_tmp}',@" "${AP_TMP_DIR}/ap_nextcloud_config.php"
    ap_pos=$(sudo grep -n ");" "${AP_TMP_DIR}/ap_nextcloud_config.php" | head -1 | cut -d ':' -f 1)
    gsed -i'' "${ap_pos}i'htaccess.RewriteBase' => '/'," "${AP_TMP_DIR}/ap_nextcloud_config.php"

    ## Overwrite current nextcloud config file
    sudo cp -f "${AP_TMP_DIR}/ap_nextcloud_config.php" "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}"
    sudo chown "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}.${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}"
    sudo chmod 640 "${AP_NEXTCLOUD_SERVER_CONFIG_FILE}"

    # Update .htaccess file
    @logshow "Update nextcloud .htaccess\n"
    sudo -u "${AP_NEXTCLOUD_SERVER_APACHE_OWNER}" php "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}/occ" maintenance:update:htaccess

    @rtn_success
}

# @$alias $$ ap_func_nextcloud_update_configs {
alias ap_alias_nextcloud_update_configs='ap_func_nextcloud_update_configs'
# }

# @$func $$ ap_func_nextcloud_update_configs {
# ap_func_nextcloud_update_configs
# Description
# 	Update nextcloud config files
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_nextcloud_update_configs() {
    @minfo "Updating [ap_common.config.php] file\n"
    sudo cp -f "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/docroot/ap_common.config.php" "${AP_NEXTCLOUD_SERVER_DOCUMENT_ROOT}/config/"

    # Restart Apache2
    @minfo "Restart Apache2\n"
    sudo systemctl restart apache2

    @rtn_success
}
