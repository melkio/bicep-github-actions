targetScope = 'subscription'

@description('Specifies the location for resources.')
param location string = 'westeurope'

@description('Specifies the name of the resource group.')
param resourceGroupName string

@description('Specifies custom tags to append to common ones')
param customTags object = {}

var commonTags = {
  script: 'true'
  owner: 'CodicePlastico'
}

resource main 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourceGroupName
  location: location
  tags: union(commonTags, customTags)
}

// module infrastructure './infrastructure.bicep' = {
//   scope: main
//   name: 'infrastructure'
//   params: {
//     location: location
//     commonTags: commonTags
//   }
// }

