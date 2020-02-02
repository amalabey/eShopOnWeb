[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Environment,
    [Parameter()]
    [string]
    $Location = "australiasoutheast"
)

# Create/ensure resource group
$resourceGroupName = "eshoponweb-$($Environment)-rg"
az group create --location $Location --name $resourceGroupName

# Create app service plan (in FREE tier)
$appServicePlanName = "eshoponweb-$($Environment)-asp"
az appservice plan create --name $appServicePlanName --resource-group $resourceGroupName --sku FREE

# Create web app
$appServiceName = "eshoponweb-$($Environment)-as"
az webapp create --name $appServiceName --resource-group $resourceGroupName --plan $appServicePlanName 
