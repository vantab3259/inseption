FROM debian:11

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql

EXPOSE 33067

COPY ./tools/dbscript.sh ./
RUN chmod +x ./dbscript.sh

ENTRYPOINT ["bash", "./dbscript.sh"]