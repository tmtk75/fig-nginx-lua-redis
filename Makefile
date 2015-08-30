setup: lua-resty-redis

lua-resty-redis:
	git clone https://github.com/openresty/lua-resty-redis.git

nginx1:
	@docker exec -it fignginxluaredis_nginx1_1 /bin/bash

reload:
	@docker exec -it fignginxluaredis_nginx1_1 nginx -s reload
	@docker exec -it fignginxluaredis_nginx2_1 nginx -s reload

###
### Examples
###
hello:
	@curl `boot2docker ip`:8080/hellolua

foo:
	@curl `boot2docker ip`:8080/foo

bar:
	@curl `boot2docker ip`:8080/bar

###
### Redis
###
redis-cli:
	redis-cli -h `boot2docker ip 2>/dev/null`

dog:
	@redis-cli -h `boot2docker ip 2>/dev/null` get dog

