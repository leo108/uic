#!/bin/bash
if [ x$DB_HOST == x ]; then
    echo 'Need env DB_HOST'
    exit 1
fi
if [ x$DB_NAME == x ]; then
    echo 'Need env DB_NAME'
    exit 1
fi
if [ x$DB_USER == x ]; then
    echo 'Need env DB_USER'
    exit 1
fi
if [ x$DB_PWD == x ]; then
    echo 'Need env DB_PWD'
    exit 1
fi
if [ x$MC_ADDR == x ]; then
    echo 'Need env MC_ADDR'
    exit 1
fi
configFile=${APP_DIR}/uic/web/WEB-INF/config.txt
sed -i "s/{DB_HOST}/${DB_HOST}/g" $configFile \
    && sed -i "s/{DB_NAME}/${DB_NAME}/g" $configFile \
    && sed -i "s/{DB_USER}/${DB_USER}/g" $configFile \
    && sed -i "s/{DB_PWD}/${DB_PWD}/g" $configFile \
    && sed -i "s/{MC_ADDR}/${MC_ADDR}/g" $configFile
catalina.sh run
