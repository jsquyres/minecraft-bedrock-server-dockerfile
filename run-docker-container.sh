#!/bin/bash

# Take the Docker minecraft-bedrock-server image and run it as a
# container in the background.
container_name=squyres.com-minecraft-bedrock-server

host_dir=`dirname $0`
pushd $host_dir
host_dir=`pwd`
popd

export_dir="$host_dir/export-from-container"
if test ! "$export_dir"; then
    mkdir -p "$export_dir"
fi

docker run \
       --detach \
       --publish 19132:19132/udp \
       -v $export_dir:/export-to-host \
       --name $container_name \
       minecraft-bedrock-server

cat <<EOF

Docker container launched in the background.
To attach:

    docker exec -it $container_name /bin/bash

EOF
