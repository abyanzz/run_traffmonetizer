#!/bin/bash

# Nama image docker Traffmonetizer
image_name="traffmonetizer/cli_v2"

# Token untuk Traffmonetizer
token="kKo6rC6UDnE3thQMxCZ3lL6/XojlIRIcXyG15TjeVd0="

# Jalankan container pertama dengan IP asli
container_name1="traffmonetizer_1"

# Hentikan dan hapus container jika sudah ada
if [ "$(docker ps -a -q -f name=$container_name1)" ]; then
    docker stop $container_name1
    docker rm $container_name1
fi

# Jalankan container pertama dengan IP asli
docker run -d --name $container_name1 -e TOKEN=$token $image_name

# Jalankan container kedua dengan proxy SOCKS5
container_name2="traffmonetizer_2"
proxy_socks5="http://dmqkq:tjwpatm9@45.195.80.59:5432"

# Hentikan dan hapus container jika sudah ada
if [ "$(docker ps -a -q -f name=$container_name2)" ]; then
    docker stop $container_name2
    docker rm $container_name2
fi

# Jalankan container kedua dengan proxy SOCKS5
docker run -d --name $container_name2 -e TOKEN=$token -e ALL_PROXY=$proxy_socks5 $image_name
