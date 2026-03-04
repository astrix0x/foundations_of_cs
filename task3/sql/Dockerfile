FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=college_club

COPY schema.sql /docker-entrypoint-initdb.d/01_schema.sql
COPY task3_dump.sql /docker-entrypoint-initdb.d/02_dump.sql

EXPOSE 3306