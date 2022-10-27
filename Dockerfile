FROM tomcat:9.0-jdk15

LABEL maintainer="swe-645"

ADD swe-hw2.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
