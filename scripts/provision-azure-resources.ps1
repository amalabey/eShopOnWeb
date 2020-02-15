[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Environment,
    [Parameter()]
    [string]
    $Location = "australiasoutheast",
    [Parameter(Mandatory=$true)]
    [string]
    $SqlAdminUserName,
    [Parameter(Mandatory=$true)]
    [string]
    $SqlAdminPassword
)

$ErrorActionPreference = "Stop"

# Create/ensure resource group
Write-Host "Create/ensure resource group"
$resourceGroupName = "eshoponweb-$($Environment)-rg"
az group create --location $Location --name $resourceGroupName

# Create app service plan (in FREE tier)
Write-Host "Create/ensure app service plan"
$appServicePlanName = "eshoponweb-$($Environment)-asp"
az appservice plan create --name $appServicePlanName --resource-group $resourceGroupName --sku FREE

# Create web app
Write-Host "Create/ensure web app"
$appServiceName = "eshoponweb-$($Environment)-as"
az webapp create --name $appServiceName --resource-group $resourceGroupName --plan $appServicePlanName 

# Create a SQL Database server
Write-Host "Create/ensure sql server instance"
$sqlServerName = "eshoponweb-$($Environment)-sqlserver"
az sql server create --name $sqlServerName --resource-group $resourceGroupName `
--location "australiaeast" --admin-user $SqlAdminUserName --admin-password $SqlAdminPassword

# Configure firewall for Azure access
Write-Host "Create/ensure firewall to allow connections from app service"
$startIp="0.0.0.0"
$endIp="0.0.0.0"
az sql server firewall-rule create --server $sqlServerName --resource-group $resourceGroupName `
--name AzureInternal --start-ip-address $startIp --end-ip-address $endIp

# Create catalog database
Write-Host "Create/ensure catalog database"
$catalogDbName = "CatalogDb"
az sql db create --server $sqlServerName --resource-group $resourceGroupName --name $catalogDbName --service-objective S0

# Create identity database
Write-Host "Create/ensure identity database"
$identityDbName = "IdentityDb"
az sql db create --server $sqlServerName --resource-group $resourceGroupName --name $identityDbName --service-objective S0

# Get connection string for the catalog database
$catalogConnectionString=$(az sql db show-connection-string --name $catalogDbName --server $sqlServerName --client ado.net --output tsv)
$catalogConnectionString = $catalogConnectionString -replace "<username>",$SqlAdminUserName
$catalogConnectionString = $catalogConnectionString -replace "<password>",$SqlAdminPassword
Write-Host "##vso[task.setvariable variable=catalogConnectionString]$($catalogConnectionString)"

# Get connection string for the identity database
$identityConnectionString=$(az sql db show-connection-string --name $identityDbName --server $sqlServerName --client ado.net --output tsv)
$identityConnectionString = $identityConnectionString -replace "<username>",$SqlAdminUserName
$identityConnectionString = $identityConnectionString -replace "<password>",$SqlAdminPassword
Write-Host "##vso[task.setvariable variable=identityConnectionString]$($identityConnectionString)"
