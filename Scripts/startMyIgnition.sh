#! /bin/bash
#
# From: https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425#set--e--u--x--o-pipefail
# set -euxo pipefail

#docker run -p 8088:8088 \
#           --name my-ignition \
#           -e GATEWAY_ADMIN_PASSWORD=mgkahn \
#           -e IGNITION_EDITION=full \
#           -d kcollins/ignition:latest

source ./secrets.sh
source ./env.sh

docker run -p 8088:8088 \
    --name my-ignition-maker \
    -e GATEWAY_SYSTEM_NAME=mgk_maker \
    -e GATEWAY_ADMIN_USERNAME=${GATEWAY_ADMIN_USERNAME} \
    -e GATEWAY_ADMIN_PASSWORD=${GATEWAY_ADMIN_USERNAME} \
    -e IGNITION_EDITION=MAKER \
    -e IGNITION_LICENSE_KEY=${IGNITION_LICENSE_KEY} \
    -e IGNITION_ACTIVATION_TOKEN=${IGNITION_ACTIVATION_TOKEN}
    -v mgk-ignition-data:/var/lib/ignition/data \
    -d kcollins/ignition:latest


