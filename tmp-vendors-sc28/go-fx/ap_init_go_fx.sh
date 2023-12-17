if [[ "${USER}" != 'root' ]]; then
	source <(fx-completion --bash)
fi

alias fxchromebookmarks='cat "${AP_CHROME_BOOKMARK_FILE_PATH}" | fx'
