@description('Specifies the location for resources.')
param location string

@description('Specifies common tags for all resources')
param commonTags object

var storaceAccountName = uniqueString(resourceGroup().id, 'main-storage-account')
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-04-01' = {
  name: storaceAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: commonTags
}
