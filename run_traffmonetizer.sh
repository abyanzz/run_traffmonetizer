#!/bin/bash

# Jumlah container yang akan dijalankan
num_containers=5

# Nama image docker Traffmonetizer
image_name="traffmonetizer/cli_v2"

# Jalankan loop untuk membuat beberapa container
for i in $(seq 1 $num_containers); do
    container_name="traffmonetizer_$i"
    
    # Hentikan dan hapus container jika sudah ada
    docker stop $container_name
    docker rm $container_name

    # Jalankan container baru
    docker run -d --name $container_name $image_name
done
