# Dependencies: redis, ap_alias_get_redis_pw

alias rd='iredis -a "$(ap_alias_get_redis_password)"'
