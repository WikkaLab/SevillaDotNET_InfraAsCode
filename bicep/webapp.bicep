var resourceGroupName = 'sdn-rg'
var location = 'West Europe'
var appName = 'sdninfra-bicep'
var appServicePlanName = 'sdn-asp'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName 
  location: location
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
