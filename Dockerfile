FROM postgres:latest
ADD 1.create_database.sql /docker-entrypoint-initdb.d/
#WORKDIR /scripts/
#RUN ["service","psql","start"]
#RUN ["psql","-h","localhost","-p","5432","-U","postgres","<","create_database.sql"]
