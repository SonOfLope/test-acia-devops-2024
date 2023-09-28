# --- Build Stage ---
FROM postgres:15.2

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    postgresql-server-dev-15 

RUN cd /tmp \
    && git clone --branch v0.5.0 https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install

ENV POSTGRES_DB=
ENV POSTGRES_USER=
ENV POSTGRES_PASSWORD=
ENV READONLY_USER=
ENV READONLY_PASSWORD=
ENV PGDATA=/var/lib/postgresql/data/pgdata

COPY init.sh /docker-entrypoint-initdb.d/
COPY init.sql /docker-entrypoint-initdb.d/
COPY set_pg_hba.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/set_pg_hba.sh
RUN chmod +x /docker-entrypoint-initdb.d/init.sh

EXPOSE 5432