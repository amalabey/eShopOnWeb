#!/bin/bash
dotnet build eShopOnWeb.sln
dotnet ef migrations script -c catalogcontext -p src/Infrastructure/Infrastructure.csproj -s src/Web/Web.csproj -i -o catalogdb.sql
dotnet ef migrations script -c appidentitydbcontext -p src/Infrastructure/Infrastructure.csproj -s src/Web/Web.csproj -i -o identitydb.sql