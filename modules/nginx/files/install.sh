#!/usr/bin/env bash
curl -OL http://luajit.org/download/LuaJIT-2.0.2.tar.gz
mkdir luajit
tar xzvf LuaJIT-2.0.2.tar.gz
cd LuaJIT-2.0.2
make PREFIX=/usr/local/luajit
make install PREFIX=/usr/local/luajit

cd /usr/local/bin/
ln -s /usr/local/luajit/bin/luajit
luajit -v


cd /usr/local/src

git clone git://github.com/simpl/ngx_devel_kit.git
git clone git://github.com/chaoslawful/lua-nginx-module.git

yum -y install pcre-devel zlib zlib-devel


export LUAJIT_LIB=/usr/local/luajit/lib
export LUAJIT_INC=/usr/local/luajit/include/luajit-2.0

cd /usr/local
curl -OL http://nginx.org/download/nginx-1.9.3.tar.gz
tar xzvf nginx-1.9.3.tar.gz
cd nginx-1.9.3
./configure --prefix=/usr/local/nginx \
	    --add-module=/usr/local/src/ngx_devel_kit \
	    --add-module=/usr/local/src/lua-nginx-module \
            --with-ld-opt="-Wl,-rpath,$LUAJIT_LIB"


make
make install

cd /usr/local/nginx
git clone https://github.com/openresty/lua-resty-redis.git

export LD_LIBRARY_PATH=/usr/local/luajit/lib:$LD_LIBRARY_PATH
/usr/local/nginx/sbin/nginx

