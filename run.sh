#!/bin/bash
if [ x$MYSQL_PORT_3306_TCP_ADDR == x ]; then
    echo 'Need env MYSQL_PORT_3306_TCP_ADDR'
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
if [ x$MEMCACHED_PORT_11211_TCP_ADDR == x ]; then
    echo 'Need env MC_ADDR'
    exit 1
fi
if [ x$TC_USER == x ]; then
    echo 'Need env TC_USER'
    exit 1
fi
if [ x$TC_PWD == x ]; then
    echo 'Need env TC_PWD'
    exit 1
fi

configFile=${APP_DIR}/uic/web/WEB-INF/config.txt
sed -i "s/{DB_HOST}/${MYSQL_PORT_3306_TCP_ADDR}/g" $configFile \
&& sed -i "s/{DB_NAME}/${DB_NAME}/g" $configFile \
&& sed -i "s/{DB_USER}/${DB_USER}/g" $configFile \
&& sed -i "s/{DB_PWD}/${DB_PWD}/g" $configFile \
&& sed -i "s/{MC_ADDR}/${MEMCACHED_PORT_11211_TCP_ADDR}:${MEMCACHED_PORT_11211_TCP_PORT}/g" $configFile
userFile=${CATALINA_HOME}/conf/tomcat-users.xml
sed -i "s/{TC_USER}/${TC_USER}/g" $userFile \
&& sed -i "s/{TC_PWD}/${TC_PWD}/g" $userFile
catalina.sh run
