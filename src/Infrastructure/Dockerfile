FROM mcr.microsoft.com/mssql/server:2019-latest
COPY *.sql .
ENV ACCEPT_EULA Y
ENV sa_password Test123$
RUN /opt/mssql-tools/bin/sqlcmd -i create-dbs.sql -S localhost
RUN /opt/mssql-tools/bin/sqlcmd -i catalogdb.sql -d CatalogDb
RUN /opt/mssql-tools/bin/sqlcmd -i identitydb.sql -d IdentityDb