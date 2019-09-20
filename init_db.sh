#!/bin/bash

# Script de configuration de la base de données

if [ ${DB_ENGINE} == 'mysql' ]; then # docker run -d -e MYSQL_ROOT_PASSWORD=root --name=mysql0 mysql:5.7

    # Modification du fichier de configuration
    sed -i "s/jdbc.dbms=hsqldb/jdbc.dbms=mysql/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.driver=org.hsqldb.jdbc.JDBCDriver/jdbc.driver=com.mysql.jdbc.Driver/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.url=jdbc:hsqldb:mem:logicaldoc/jdbc.url=jdbc:mysql:\/\/ldhost:3306\/${DB_NAME}?useSSL=false\&allowPublicKeyRetrieval=true/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.username=sa/jdbc.username=${DB_USERNAME}/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.password=/jdbc.password=${DB_USERPW}/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/cas.enabled=false/cas.enabled=true/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/cas.lang=en/cas.lang=fr/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties

# sed -i s?jdbc.driver=org.hsqldb.jdbc.JDBCDriver?jdbc.driver=com.mysql.cj.jdbc.Driver?

    # Création de la base de données
    sed -i "s/XX_DB_NAME/${DB_NAME}/g" ./init_db.sql
    sed -i "s/XX_DB_USERNAME/${DB_USERNAME}/g" ./init_db.sql
    sed -i "s/XX_DB_USERPW/${DB_USERPW}/g" ./init_db.sql

    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -h ldhost --force < init_db.sql
    mysql -u ${DB_USERNAME} -p${DB_USERPW} -h ldhost -D ${DB_NAME} -e 'source /usr/local/tomcat/bin/logical_mysql.sql;'
fi

if [ ${DB_ENGINE} == 'postgresql' ]; then

    # Modification du fichier de configuration

    sed -i "s/jdbc.dbms=hsqldb/jdbc.dbms=postgres/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.driver=org.hsqldb.jdbc.JDBCDriver/jdbc.driver=org.postgresql.Driver/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.url=jdbc:hsqldb:mem:logicaldoc/jdbc.url=jdbc:postgresql:\/\/ldhost:5432\/${DB_NAME}/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.username=sa/jdbc.username=${DB_USERNAME}/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/jdbc.password=/jdbc.password=${DB_USERPW}/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/cas.enabled=false/cas.enabled=true/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties
    sed -i "s/cas.lang=en/cas.lang=fr/" /usr/local/tomcat/webapps/logicaldoc/WEB-INF/classes/context.properties

    # Création de la base de données
    sed -i "s/XX_DB_NAME/${DB_NAME}/g" ./init_db_psql.sql
    sed -i "s/XX_DB_USERNAME/${DB_USERNAME}/g" ./init_db_psql.sql
    sed -i "s/XX_DB_USERPW/${DB_USERPW}/g" ./init_db_psql.sql

    PGPASSWORD=$POSTGRES_PASSWORD psql -U postgres -h ldhost < init_db_psql.sql
    PGPASSWORD=$POSTGRES_PASSWORD psql -U postgres -h ldhost -d ${DB_NAME} -f logical_postgres.sql
fi

# docker build --no-cache -t logicaldoc .
# docker run -it logicaldoc bash
# docker exec -it mysql0 mysql -uroot -p
# docker ps -q
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id