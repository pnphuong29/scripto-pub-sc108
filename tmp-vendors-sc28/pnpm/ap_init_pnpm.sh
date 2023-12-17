export PNPM_HOME=~/.local/share/pnpm
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

alias pn="pnpm"
