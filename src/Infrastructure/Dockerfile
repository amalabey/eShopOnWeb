FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

COPY *.sln .
COPY . .

RUN dotnet tool install --global dotnet-ef --version 3.1.1
ENV PATH="${PATH}:/root/.dotnet/tools"

RUN dotnet restore src/Infrastructure/Infrastructure.csproj

RUN dotnet ef migrations script -c catalogcontext \
 -p src/Infrastructure/Infrastructure.csproj \
 -s src/Web/Web.csproj \
 -i -o sql/catalogdb.sql

RUN dotnet ef migrations script -c appidentitydbcontext \
-p src/Infrastructure/Infrastructure.csproj \
-s src/Web/Web.csproj \
-i -o sql/identitydb.sql

FROM mcr.microsoft.com/mssql/server:2017-latest AS runtime

WORKDIR /sql
COPY --from=build /app/sql ./
COPY src/Infrastructure/*.sh ./
COPY src/Infrastructure/*.sql ./

ENV SA_PASSWORD=Test
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Developer

RUN chmod +x create-schema.sh
RUN chmod +x entrypoint.sh

EXPOSE 1433

ENTRYPOINT ["./entrypoint.sh"]
CMD ["sleep infinity"]

