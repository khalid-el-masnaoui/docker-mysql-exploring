FROM mysql:8.0-debian

SHELL ["/bin/bash", "-c"]

RUN chmod 1777 /tmp
RUN  apt-get update -y && apt-get install -y procps

#assign the created user same UID AND GUID OF the host for the mounted dir owner
ARG UID
ARG GID

RUN usermod -u $UID mysql
RUN groupmod -g $GID mysql

# Add a database
ENV MYSQL_DATABASE khalid
ENV MYSQL_ROOT_PASSWORD secret

COPY ./initScripts/ /docker-entrypoint-initdb.d/

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3306

RUN chown -R mysql:mysql /var/lib/mysql

user mysql

# Define mountable directories
VOLUME ["/var/lib/mysql"]

