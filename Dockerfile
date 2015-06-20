FROM tomcat:8
ENV APP_DIR ${CATALINA_HOME}/webapps/
COPY uic ${APP_DIR}/uic
COPY server.xml ${CATALINA_HOME}/conf/server.xml
COPY run.sh /run.sh
CMD ["/run.sh"]
