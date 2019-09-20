FROM tomcat:9.0-jdk11-openjdk-slim

ENV DB_ENGINE mysql
ENV DB_NAME logicaldoc
ENV DB_USERNAME logicaldoc
ENV DB_USERPW picon
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_ROOT_HOST %
ENV POSTGRES_PASSWORD root

RUN apt-get update; apt-get install -y wget; \
    apt-get install -y default-mysql-client; \
    apt-get install -y postgresql-client

RUN cd ./webapps; wget https://dropbox.com/s/cf999m4djxm6m7z/logicaldoc.war; \
        mkdir logicaldoc; mv logicaldoc.war logicaldoc/; \
        cd logicaldoc; jar -xvf logicaldoc.war; rm -f logicaldoc.war

RUN mkdir /var/log/logicaldoc; touch /var/log/logicaldoc/error.log

EXPOSE 8080

WORKDIR /usr/local/tomcat/bin

COPY init_db.sh .
COPY init_db.sql .
COPY init_db_psql.sql .
COPY logical_mysql.sql .
COPY logical_postgres.sql .
RUN chmod +x init_db.sh

CMD  init_db.sh; startup.sh && tail -F /var/log/logicaldoc/error.log