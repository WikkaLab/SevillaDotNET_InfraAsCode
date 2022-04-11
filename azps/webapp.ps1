# Params
$location = "West Europe"
$appName = "sdninfra-ps"
$rgName = "sdninfra-ps-rg"
$appServicePlanName = "sdninfra-ps-sp"

# Creando resource group
New-AzResourceGroup `
    -Name $rgName `
    -Location $location

# Creando App service plan
New-AzAppServicePlan `
    -ResourceGroupName $rgName `
    -Name $appServicePlanName `
    -Location $location `
    -Tier "Free"

# Creando web app
New-AzWebApp `
    -ResourceGroupName $rgName `
    -Name $appName `
    -Location $location `
    -AppServicePlan $appServicePlanName