#!/bin/sh

set -e
set -x

apk update
apk add openssh expect

expect -c "
spawn scp ${INPUTS_NAME}/openresty-${OPENRESTY_VERSION}.rpm ${USERNAME}@${TARGET_HOST}:${TARGET_PATH}
expect \"(yes/no)?\"
send \"yes\n\"
expect \"password:\"
send \"${PASSWORD}\n\"
"
