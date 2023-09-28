FROM mysql:8.0-debian

SHELL ["/bin/bash", "-c"]

RUN chmod 1777 /tmp
RUN  apt-get update -y && apt-get install -y procps

# Add a database
ENV MYSQL_DATABASE khalid
ENV MYSQL_ROOT_PASSWORD secret

COPY ./initScripts/ /docker-entrypoint-initdb.d/

EXPOSE 3306
