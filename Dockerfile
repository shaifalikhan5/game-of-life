FROM donglsheng/tomcat9_jdk8:latest
COPY target/gameoflife.war /usr/local/soft/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD [ "catalina.sh","run" ]