start = up
stop = halt
restart = !vagrant halt && vagrant up

remove = !vagrant destroy -f && rm -rf .vagrant logs &>/dev/null
rebuild = !vagrant remove && vagrant up
