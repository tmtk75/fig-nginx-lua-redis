# README

This repository provides a test environment for
[lua-nginx-module](https://github.com/openresty/lua-nginx-module)
with [lua-resty-redis](https://github.com/openresty/lua-resty-redis)
on Docker and Vagrant.

Working with
- Two nginx containers
- Three redis containers configured to work in replication.
- Two echo server containers

See [this AA](docker-compose.yml).


# Getting Started
To get `lua-resty-redis`, type
```
make setup
```

Open two terminals [0] and [1].
```
[0]$ docker-compose up

[1]$ make dog
(nil)
[1]$ make hello
...
[1]$ make dog
"an animal ..."
```

# Reload
This is configure to reload `nginx.conf` easily.

Please type `make reload` when all containers run well.

