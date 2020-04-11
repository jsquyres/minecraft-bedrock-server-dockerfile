#!/bin/bash

# Take the Docker minecraft-bedrock-server image and run it as a
# container in the background.
container_name=squyres.com-minecraft-bedrock-server

host_dir=`dirname $0`
pushd $host_dir
host_dir=`pwd`
popd

container_app_root=/minecraft-pmmp

host_players_dir="$host_dir/players"
host_worlds_dir="$host_dir/worlds"
if test ! -d "$host_players_dir"; then
    mkdir -p "$host_players_dir"
fi
if test ! -d "$host_worlds_dir"; then
    mkdir -p "$host_worlds_dir"
fi

if test -r "$host_dir/ip.txt"; then
    ip=`cat $host_dir/ip.txt`:
fi

docker run \
       --detach \
       --publish ${ip}19132:19132/udp \
       -v $host_players_dir:$container_app_root/players \
       -v $host_worlds_dir:$container_app_root/worlds \
       --name $container_name \
       minecraft-bedrock-server

cat <<EOF

Docker container launched in the background.
To attach:

    docker exec -it $container_name /bin/bash

EOF
