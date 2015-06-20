FROM tomcat:8
ENV APP_DIR ${CATALINA_HOME}/webapps/
COPY uic ${APP_DIR}
COPY server.xml ${CATALINA_HOME}/conf/server.xml
#todo sed config
