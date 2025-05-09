FROM ubuntu:22.04

# Actualizar sistema e instalar Java
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-17-jre-headless

# Crear directorio Tomcat y descargarlo
RUN mkdir /opt/tomcat
WORKDIR /tmp
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.40/bin/apache-tomcat-10.1.40.tar.gz .
RUN tar -xzvf apache-tomcat-10.1.40.tar.gz -C /opt/tomcat --strip-components=1

# Copiar el archivo WAR a la carpeta webapps
COPY ./*.war /opt/tomcat/webapps/

# Exponer el puerto por defecto de Tomcat
EXPOSE 8080

# Ejecutar Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
