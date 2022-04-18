var resourceGroupName = 'sdn-rg'
var location = 'West Europe'
var appName = 'sdninfra-bicep'
var appServicePlanName = 'sdn-asp'

// resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
//   name: resourceGroupName
//   location: location
// }

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName 
  location: location
  sku: {
    name: 'Free'
    capacity: 1
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: appName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      minTlsVersion: '1.2'
    }
  }
}
