FROM ubuntu:22.04

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Instalar Java y dependencias
RUN apt-get update && apt-get install -y openjdk-17-jre-headless curl && \
    rm -rf /var/lib/apt/lists/*

# Descargar y descomprimir Tomcat
RUN mkdir -p /opt/tomcat
WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.40/bin/apache-tomcat-10.1.40.tar.gz && \
    tar -xzf apache-tomcat-10.1.40.tar.gz --strip-components=1 && \
    rm apache-tomcat-10.1.40.tar.gz

# Copiar WAR a webapps
COPY ./*.war /opt/tomcat/webapps/

# Exponer el puerto
EXPOSE 8080

# Ejecutar Tomcat
CMD ["catalina.sh", "run"]
