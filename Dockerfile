FROM ubuntu:22.04

# Instalar Java (OpenJDK 17) y preparar Tomcat
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-17-jre-headless
RUN mkdir /opt/tomcat
WORKDIR /tmp
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.40/bin/apache-tomcat-10.1.40.tar.gz .
RUN tar -xzvf apache-tomcat-10.1.40.tar.gz -C /opt/tomcat --strip-components=1

# Copiar la aplicación web (archivo WAR) al directorio webapps de Tomcat
COPY ./*.war /opt/tomcat/webapps/

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
