export AP_VENDORS_WP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/wp"
export AP_VENDORS_WP_SETUP_CONFIGS_DIR="${AP_VENDORS_WP_SETUP_DIR}/configs"
export AP_VENDORS_WP_DL_URL="https://wordpress.org/download/"
export AP_VENDORS_WP_DIR="${AP_SOFT_DIR}/wp"

alias viscwpinit="vi ${AP_VENDORS_WP_SETUP_DIR}/ap_init_wp.sh"
alias cpwptodev7="sudo rm -rf ${AP_PRJ_DEV7_DIR}/wp; cp -R ${AP_VENDORS_WP_DIR} ${AP_PRJ_DEV7_DIR}/wp"

# @$alias $$ ap_func_wp_download {
alias ap_alias_wp_download='ap_func_wp_download'
alias dlwp='ap_func_wp_download'
# }

# @$func $$ ap_func_wp_download {
# ap_func_wp_download
# Description
# 	d
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_wp_download() {
	cd ${AP_TMP_DIR}
	rm -f wordpress_latest.zip
	curl -SL https://wordpress.org/latest.zip >wordpress_latest.zip
	unzip wordpress_latest.zip
	rm -rf ${AP_SOFT_DIR}/wp
	mv wordpress ${AP_SOFT_DIR}/wp
	@rtn_success
}

# @$alias $$ ap_func_wp_create_project {
alias ap_alias_wp_create_project='ap_func_wp_create_project'
alias ap_alias_wp_create_project_default='ap_func_wp_create_project'
# }

# @$func $$ ap_func_wp_create_project [-htilsp] [db_user_pw] [template_name] [project_location] [site_url] [template_version] [--] [project_name] {
# Description
# 	Create WordPress project from template
# Options
# 	-h 											Show help information
# 	-t [template_name] 			Project template ('wp' as default if not specified)
#														Valid values are ['wp', 'woo']
# 	-i [template_version] 	Wordpress version for the new project ('5.6' as default version if not specified)
# 	-l [project_location] 	Specify path to the directory containing the new project folder
#														or use "${AP_WD_DIR}/dev" as default location
# 	-s [site_url] 					Specify URL of the new project
# 	-p [db_user_pw]					DB user password
# Parameters
# 	[project_name] 					Name of the project to create
# Return
# 	0:  True
# 	1:  False
# }
ap_func_wp_create_project() {
	local ap_opts_string='t:i:l:s:p:'

	# Parse options
	local ap_opt=''
	local ap_opt_db_user_pw=''
	local ap_opt_template_name='wordpress'
	local ap_opt_template_ver='5.6'
	local ap_opt_site_url=''
	local ap_project_location="${AP_DEV_DIR}"

	unset OPTIND

	while getopts "${ap_opts_string}" ap_opt; do
		case "${ap_opt}" in
		't')
			case "${OPTARG}" in
			'wp')
				ap_opt_template_name='wordpress'
				;;
			'woo')
				ap_opt_template_name='woocommerce'
				;;
			*)
				__ap_alias_logs_error_invalid_options_and_return_fail
				;;
			esac
			;;
		'i')
			ap_opt_template_ver="${OPTARG}"
			;;
		'l')
			ap_project_location="${OPTARG}"
			;;
		's')
			ap_opt_site_url="${OPTARG}"
			;;
		'p')
			ap_opt_db_user_pw="${OPTARG}"
			;;
		':')
			__ap_alias_logs_error_missing_option_argument_and_return_fail
			;;
		*)
			__ap_alias_logs_error_invalid_options_and_return_fail
			;;
		esac
	done

	local ap_project_template="${ap_opt_template_name}-${ap_opt_template_ver}"

	# Remove all options in parameter list
	shift $((OPTIND - 1))

	# Input project name
	if [ -z "${1:-}" ]; then
		@merr "Missing project name"
		ap_alias_ret_err_missing_info
	else
		local ap_project_name="${1}"
	fi

	local ap_project_path="${ap_project_location}/${ap_project_name}"
	local ap_db_name="${ap_project_name//-/_}"
	local ap_db_import_file_path="${AP_TEMPLATES_DIR}/${ap_project_template}/db/db.sql"

	# Check if this project already existed?
	if [ -d "${ap_project_path}" ]; then
		printf "This project name already existed at this location [%s]!\n" "${ap_project_location}"
		ap_alias_get_input_from_user "Do you want to override? (Y/N): "

		if [ "${apg_return_results}" = "y" ] || [ "${apg_return_results}" = "Y" ]; then
			rm -rf "${ap_project_path}"
		else
			printf "Bye!\n"
			@rtn_success
		fi
	fi

	# Create project
	if [ ! -d "${AP_TEMPLATES_DIR}/${ap_project_template}" ]; then
		ap_alias_logs_write_output_error "Cannot find project template at [${AP_TEMPLATES_DIR}/${ap_project_template}]"
		__ap_alias_return_code 1
	fi

	cp -R "${AP_TEMPLATES_DIR}/${ap_project_template}" "${ap_project_path}"
	printf "Successfully create project [${ap_project_name}].\n"

	# Get DB user password
	if [ -z "${ap_opt_db_user_pw}" ]; then
		ap_alias_get_input_from_user -r -s "Enter user password to access DB: "
		ap_opt_db_user_pw="${apg_return_results}"
	fi

	# Create db user
	ap_func_mysql_create_db_user -p "${ap_opt_db_user_pw}" -- "${ap_db_name}"

	if [ $? -eq 0 ]; then
		printf "Successfully create db & user [${ap_db_name}].\n"

		# If project directory does not exist then return
		[ ! -d "${ap_project_path}" ] && @rtn_success

		# Process string interpolation for config files
		local ap_project_base_dir=''
		local ap_tmp_var=''

		printf -v ap_tmp_var "%s" $(echo "${AP_WD_DIR}/" | sed 's/\//\\\//g')
		printf -v ap_tmp_var "echo %s | sed 's/%s//g'" "${ap_project_path}" "${ap_tmp_var}"
		printf -v ap_project_base_dir "%s" $(eval "${ap_tmp_var}")

		if [ -z "${ap_opt_site_url}" ]; then
			ap_opt_site_url="http://${AP_APACHE_HTTP_HOST}:${AP_APACHE_HTTP_PORT}/${ap_project_base_dir}"
		fi

		[ ! -d "${AP_TMP_DIR}" ] && mkdir -p "${AP_TMP_DIR}"

		local ap_tmp_file="${AP_TMP_DIR}/tmp.sh"
		local ap_src_files=$(
			cat <<-EOF
				${AP_TEMPLATES_DIR}/${ap_project_template}/.htaccess
				${AP_TEMPLATES_DIR}/${ap_project_template}/wp-config.php
			EOF
		)

		while read -r ap_src_file; do
			[ ! -f "${ap_src_file}" ] && ap_alias_logs_write_warning_output "File [${ap_src_file}] not found!" && continue
			ap_alias_logs_write_output_info "Processing file [${ap_src_file}]"

			# Process string interpolation
			cat "${ap_src_file}" >"${ap_tmp_file}"
			ap_func_utils_find_and_replace_config_patterns "${ap_tmp_file}"

			# Move confile file to project directory
			ap_tmp_dst_file=$(basename -- "${ap_src_file}")
			mv "${ap_tmp_file}" "${AP_TMP_DIR}/${ap_tmp_dst_file}"
			mv -f "${AP_TMP_DIR}/${ap_tmp_dst_file}" "${ap_project_path}"/
		done < <(echo "${ap_src_files}")

		printf "Successfully update config files for project [${ap_project_name}].\n"

		# Import DB
		ap_func_mysql_import -p "${ap_opt_db_user_pw}" -- "${ap_db_name}" "${ap_db_import_file_path}"

		if [ $? -eq 0 ]; then
			printf "Successfully import database [${ap_db_name}].\n"
		else
			printf "Failed to import database [${ap_db_name}].\n"
			__ap_alias_return_code 1
		fi

		# Migrate site and update DB
		local ap_wp_template_site_url="http://apache:8021/dev/wordpress"
		ap_func_wp_migrate_site -p "${ap_opt_db_user_pw}" -s "${ap_opt_site_url}" -- "${ap_db_name}" "${ap_wp_template_site_url}" "${ap_opt_site_url}"

		local ap_db_table_field_blogname=''
		local ap_db_table_field_blogdescription=''
		local ap_db_table_field_admin_email='nidnos@gmail.com'
		local ap_word=''

		while read -r ap_word; do
			local ap_tmp=$(printf "${ap_word}" | tr '[:lower:]' '[:upper:]')
			ap_word="${ap_tmp:0:1}${ap_word:1}"
			ap_db_table_field_blogname+="${ap_word} "
		done < <(echo "${ap_db_name}" | sed -e $'s/_/\\\n/g')

		ap_db_table_field_blogname="${ap_db_table_field_blogname% }"
		ap_db_table_field_blogdescription="${ap_db_table_field_blogname}"

		local ap_sql_queries=$(
			cat <<-EOF
				USE \`${ap_db_name}\`;
				UPDATE \`wp_options\` SET \`option_value\`='${ap_db_table_field_blogname}' WHERE \`option_name\`='blogname';
				UPDATE \`wp_options\` SET \`option_value\`='${ap_db_table_field_blogdescription}' WHERE \`option_name\`='blogdescription';
				UPDATE \`wp_options\` SET \`option_value\`='${ap_db_table_field_admin_email}' WHERE \`option_name\`='admin_email';
			EOF
		)

		ap_func_mysql_execute_queries -p "${ap_opt_db_user_pw}" -- "${ap_sql_queries}"

		if [ $? -eq 0 ]; then
			printf "Successfully update configuration for database [${ap_db_name}].\n"
			unset apg_return_results
			@rtn_success
		else
			printf "Failed to update configuration for database [${ap_db_name}].\n"
			unset apg_return_results
			__ap_alias_return_code 1
		fi
	else
		printf "Failed to create db & user [${ap_db_name}].\n"
		unset apg_return_results
		__ap_alias_return_code 1
	fi
}

# @$alias $$ ap_func_wp_migrate_site {
alias ap_alias_wp_migrate_site='ap_func_wp_migrate_site'
alias ap_alias_wp_migrate_site_default='ap_func_wp_migrate_site'
# }

# @$func $$ ap_func_wp_migrate_site [-hps] [db_user_pw] [new_site_url] [--] *[db_name] *[new_url] *[current_url] {
# Description
# 	Migrate site information in database
# Options
# 	-h  				Show help information
# 	-p [db_user_pw]		DB user password
# 	-s [new_site_url]	New site URL
# Parameters
# 	*[db_name] 			DB name
# 	*[new_url] 			New URL
# 	*[current_url] 		Current URL
# Return
# 	0:  True
# 	1:  False
# }
ap_func_wp_migrate_site() {
	local ap_opts_string='hp:s:'

	# Parse options
	local ap_opt=''
	local ap_opt_db_user_pw=''
	local ap_opt_new_site_url=''

	unset OPTIND

	while getopts "${ap_opts_string}" ap_opt; do
		case "${ap_opt}" in
		'h')
			ap_alias_show_help_info_and_return_success
			;;
		'p')
			ap_opt_db_user_pw="${OPTARG}"
			;;
		's')
			ap_opt_new_site_url="${OPTARG}"
			;;
		':')
			__ap_alias_logs_error_missing_option_argument_and_return_fail
			;;
		*)
			__ap_alias_logs_error_invalid_options_and_return_fail
			;;
		esac
	done

	# Remove all options in parameter list
	shift $((OPTIND - 1))

	# Define variables
	local ap_param_db_name="${1:-}"
	local ap_param_new_url="${2:-}"
	local ap_param_current_url="${3:-}"

	# Validation
	[ -z "${ap_param_db_name}" ] && ap_alias_logs_write_output_error "Missing DB name!" && __ap_alias_return_code 1
	[ -z "${ap_param_current_url}" ] && ap_alias_logs_write_output_error "Missing current URL!" && __ap_alias_return_code 1
	[ -z "${ap_param_new_url}" ] && ap_alias_logs_write_output_error "Missing new URL!" && __ap_alias_return_code 1

	# Implementation
	local ap_sql_queries=''
	local ap_table_name=''
	local ap_field_name=''
	local ap_field_id=''

	local ap_escaped_current_url=$(printf "${ap_param_current_url}" | sed 's/\//\\\//g')
	local ap_escaped_new_url=$(printf "${ap_param_new_url}" | sed 's/\//\\\//g')

	local ap_db_table_list="
		option_id, option_value, wp_options
		ID, guid, wp_posts
		ID, post_content, wp_posts
		ID, user_url, wp_users
		action_id, query, wp_wc_admin_note_actions
	"

	# Get DB user password
	if [ -z "${ap_opt_db_user_pw}" ]; then
		ap_alias_get_input_from_user -r -s "Enter user password to access DB: "
		ap_opt_db_user_pw="${apg_return_results}"
	fi

	# Implementation
	while read -r ap_db_table; do
		[ -z "${ap_db_table}" ] && continue
		# printf "${ap_db_table}" | IFS=', ' read -r ap_field_id ap_field_name ap_table_name
		IFS=', ' read -r ap_field_id ap_field_name ap_table_name < <(printf "${ap_db_table}")

		ap_alias_logs_write_output_info "Processing table [${ap_table_name}] with field [${ap_field_id}] and [${ap_field_name}]"

		ap_sql_queries=$(
			cat <<-EOF
				USE \`${ap_param_db_name}\`;
				SELECT \`${ap_field_id}\`
					FROM \`${ap_table_name}\`
					WHERE \`${ap_field_name}\` LIKE '%${ap_param_current_url}%';
			EOF
		)

		ap_func_mysql_execute_queries -p "${ap_opt_db_user_pw}" -- "${ap_sql_queries}"
		local ap_record_id_list="${apg_sql_results}"
		[ -z "${ap_record_id_list}" ] && continue

		local ap_tmp=''
		local ap_record_id=''

		while read -r ap_record_id; do
			[ -z "${ap_tmp}" ] && ap_tmp=1 && continue # Ignore header row in result set

			ap_sql_queries=$(
				cat <<-EOF
					USE \`${ap_param_db_name}\`;
					SELECT \`${ap_field_name}\`
						FROM \`${ap_table_name}\`
						WHERE \`${ap_field_id}\`='${ap_record_id}';
				EOF
			)

			ap_func_mysql_execute_queries -p "${ap_opt_db_user_pw}" -- "${ap_sql_queries}"
			[ -z "${apg_sql_results}" ] && continue

			[ ! -d "${AP_TMP_DIR}" ] && mkdir -p "${AP_TMP_DIR}"

			local ap_tmp_file="${AP_TMP_DIR}/${0}.tmp.txt"
			printf "${apg_sql_results}" >"${ap_tmp_file}"
			sed -i"" '1d' "${ap_tmp_file}"

			local ap_cmd=''
			printf -v ap_cmd "sed -i"" -E 's/%s/%s/g' \"%s\"" "${ap_escaped_current_url}" "${ap_escaped_new_url}" "${ap_tmp_file}"
			eval "$ap_cmd"

			sed -i"" "s/\'/\\\'/g" "${ap_tmp_file}"
			local ap_record_value=$(cat "${ap_tmp_file}")

			ap_sql_queries=$(
				cat <<-EOF
					USE \`${ap_param_db_name}\`;
					UPDATE \`${ap_table_name}\`
						SET \`${ap_field_name}\`='${ap_record_value}'
						WHERE \`${ap_field_id}\`='${ap_record_id}';
				EOF
			)

			ap_func_mysql_execute_queries -p "${ap_opt_db_user_pw}" -- "${ap_sql_queries}"
		done < <(printf "${ap_record_id_list}")
	done < <(printf "${ap_db_table_list}")

	# Update new site URL
	if [ -n "${ap_opt_new_site_url}" ]; then
		ap_sql_queries=$(
			cat <<-EOF
				USE \`${ap_param_db_name}\`;
					UPDATE \`wp_options\` SET \`option_value\`='${ap_opt_new_site_url}' WHERE \`option_name\`='siteurl';
					UPDATE \`wp_options\` SET \`option_value\`='${ap_opt_new_site_url}' WHERE \`option_name\`='home';
			EOF
		)

		ap_func_mysql_execute_queries -p "${ap_opt_db_user_pw}" -- "${ap_sql_queries}"
	fi

	# Remove tmp file
	rm -f "${ap_tmp_file}"

	# Unset global variables
	unset apg_return_results
	unset apg_sql_results

	# Return
	@rtn_success
}

# @$alias $$ ap_func_wp_remove_project {
alias ap_alias_wp_remove_project='ap_func_wp_remove_project'
alias ap_alias_wp_remove_project_default='ap_func_wp_remove_project'
# }

# @$func $$ ap_func_wp_remove_project [-hl] [project_location] [--] *[project_name] {
# Description
# 	Remove WordPress project
# Options
# 	-h  										Show help information
# 	-l 	[project_location] 	Specify path to project location to remove project folder
#														or use "${AP_WD_DIR}/dev" as default location
# Parameters
# 	*[project_name] 				Name of project to remove
# Return
# 	0:  True
# 	1:  False
# }
ap_func_wp_remove_project() {
	local ap_opts_string='hl:'
	local ap_opt=''
	local ap_opt_project_location="${AP_DEV_DIR}"

	unset OPTIND

	while getopts "${ap_opts_string}" ap_opt; do
		case "${ap_opt}" in
		'h')
			ap_alias_show_help_info_and_return_success
			;;
		'l')
			ap_opt_project_location="${OPTARG}"
			;;
		':')
			__ap_alias_logs_error_missing_option_argument_and_return_fail
			;;
		*)
			__ap_alias_logs_error_invalid_options_and_return_fail
			;;
		esac
	done

	# Remove all options in parameter list
	shift $((OPTIND - 1))

	# Validation
	local ap_param_project_name="${1:-}"
	[ -z "${ap_param_project_name}" ] && ap_alias_logs_write_output_error "Missing project name!" && __ap_alias_return_code 1

	# Remove project
	if [ -d "${ap_opt_project_location}/${ap_param_project_name}" ]; then
		rm -rf "${ap_opt_project_location}/${ap_param_project_name}"
		printf "Successfully remove project [${ap_param_project_name}].\n"
	else
		printf "Cannot find any projects under path [%s].\n" "${ap_opt_project_location}/${ap_param_project_name}"
	fi

	# Remove user and db
	local ap_db_name="${ap_param_project_name//-/_}"
	ap_func_mysql_remove_db_user "${ap_db_name}"
	local ap_return_status="$?"
	unset apg_return_results

	if [ "${ap_return_status}" -eq 0 ]; then
		printf "Successfully remove db & user [${ap_db_name}].\n"
		@rtn_success
	else
		printf "Failed to remove db & user [${ap_db_name}].\n"
		__ap_alias_return_code 1
	fi
}

# @$alias $$ ap_func_wp_set_user_pass {
alias ap_alias_wp_set_user_pass='ap_func_wp_set_user_pass'
alias ap_alias_wp_set_user_pass_default='ap_func_wp_set_user_pass'
# }

# @$func $$ ap_func_wp_set_user_pass [-h] [--] *[db_name] *[new_pass] [user] {
# Description
# 	Set password for user in DB
# Options
# 	-h  Show help information
# Parameters
# 	*[db_name] 		Name of DB
# 	*[new_pass] 	New password to set
# 	[user] 				User name (default: admin)
# Return
# 	0:  True
# 	1:  False
# }
ap_func_wp_set_user_pass() {
	local ap_opts_string='h'

	# Parse options
	local ap_opt=''

	unset OPTIND

	while getopts "${ap_opts_string}" ap_opt; do
		case "${ap_opt}" in
		'h')
			ap_alias_show_help_info_and_return_success
			;;
		':')
			__ap_alias_logs_error_missing_option_argument_and_return_fail
			;;
		*)
			__ap_alias_logs_error_invalid_options_and_return_fail
			;;
		esac
	done

	# Remove all options in parameter list
	shift $((OPTIND - 1))

	# Validation
	local ap_param_db_name="${1:-}"
	local ap_param_new_pass="${2:-}"
	local ap_param_user="${3:-}"
	local ap_pass_file="${AP_TMP_DIR}/md5_pass.txt"

	[ -z "${ap_param_db_name}" ] && ap_alias_logs_write_output_error "Missing DB name!" && __ap_alias_return_code 1
	[ -z "${ap_param_new_pass}" ] && ap_alias_logs_write_output_error "Missing password!" && __ap_alias_return_code 1
	[ -z "${ap_param_user}" ] && ap_param_user="admin"
	[ ! -d "${AP_TMP_DIR}" ] && mkdir -p "${AP_TMP_DIR}"

	# Generate md5 pass
	printf "${ap_param_new_pass}" >"${ap_pass_file}"
	ap_param_new_pass=$(md5 -q "${ap_pass_file}")

	local ap_sql_queries=$(
		cat <<-EOF
			USE \`${ap_param_db_name}\`;
			UPDATE \`wp_users\` SET \`user_pass\`='${ap_param_new_pass}' WHERE \`user_login\`='${ap_param_user}';
		EOF
	)

	ap_func_mysql_execute_queries "${ap_sql_queries}"
	local ap_return_status="$?"

	# Remove tmp file
	rm -f "${ap_pass_file}"

	# Return status
	if [ "${ap_return_status}" -eq 0 ]; then
		printf "Successfully update password for user [${ap_param_user}] for db [${ap_param_db_name}].\n"
		@rtn_success
	else
		printf "Failed to update password for user [${ap_param_user}] for db [${ap_param_db_name}].\n"
		__ap_alias_return_code 1
	fi
}
