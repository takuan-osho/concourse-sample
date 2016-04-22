#!/bin/sh

set -e
set -x

apk update
apk add openssh expect

expect -c "
send \"scp ${INPUTS_NAME}/openresty-${OPENRESTY_VERSION}.rpm ${USERNAME}@${TARGET_HOST}:${TARGET_PATH}\"
expect \"(yes/no)?\"
send \"yes\"
expect \"password:\"
send \"${PASSWORD}\"
"
