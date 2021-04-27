$dotnetTools = dotnet tool list --global
if ($dotnetTools -like "*dotnet-ef*") {
    Write-Host "dotnet-ef tool already installed"
}else {
    dotnet tool install --global dotnet-ef
}


dotnet ef migrations script -c catalogcontext `
-p src/Infrastructure/Infrastructure.csproj `
-s src/Web/Web.csproj `
-i -o sql/catalogdb.sql

dotnet ef migrations script -c appidentitydbcontext `
-p src/Infrastructure/Infrastructure.csproj `
-s src/Web/Web.csproj `
-i -o sql/identitydb.sql

cp src\Infrastructure\create-dbs.sql sql\create-dbs.sql