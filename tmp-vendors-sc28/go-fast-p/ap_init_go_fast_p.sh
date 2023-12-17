# https://github.com/bellecp/fast-p
# Dependencies: pdftotext, fzf, GNU grep, ag (the silver searcher)

export AP_VENDORS_FAST_P_DIR="${AP_SOFT_DIR}/fast-p"
@addpath "${AP_VENDORS_FAST_P_DIR}"

alias p='if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then __ap_fast_p_open else __ap_fast_p_xdg_open'

__ap_fast_p_open() {
	local open
	open=open # on OSX, "open" opens a pdf in preview
	ag -U -g ".pdf$" |
		fast-p |
		fzf --read0 --reverse -e -d $'\t' \
			--preview-window down:80% --preview '
            v=$(echo {q} | gtr " " "|");
            echo -e {1}"\n"{2} | ggrep -E "^|$v" -i --color=always;
        ' |
		gcut -z -f 1 -d $'\t' | gtr -d '\n' | gxargs -r --null $open >/dev/null 2>/dev/null
}

__ap_fast_p_xdg_open() {
	open=xdg-open # this will open pdf file withthe default PDF viewer on KDE, xfce, LXDE and perhaps on other desktops.

	ag -U -g ".pdf$" |
		fast-p |
		fzf --read0 --reverse -e -d $'\t' \
			--preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|");
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' |
		cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open >/dev/null 2>/dev/null
}
