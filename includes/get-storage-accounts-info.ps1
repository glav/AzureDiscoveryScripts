function GetStorageAccountsInfo {
    param(
        [System.Collections.ArrayList]$resultsArray
    ) 

    Write-Host "Retrieving Storage accounts information and configuration..."
    $jsonResult = az storage account list --query '[].{publicNetworkAccess: publicNetworkAccess, allowBlobPublicAccess:allowBlobPublicAccess, name:name, minimumTlsVersion:minimumTlsVersion, resourceGroup:resourceGroup, resourceType:type, enableHttpsTrafficOnly:enableHttpsTrafficOnly}' | ConvertFrom-Json

    Foreach ($item IN $jsonResult) {
        if ($nul -ne $item.resourceGroup -and $nul -ne $item.resourceType -and $nul -ne $item.name) {
            # $itemDetail = az resource show -g $item.resourceGroup -n $item.name --resource-type $item.resourceType | ConvertFrom-Json
            # $item.itemDetail = $itemDetail

            # Is public network access enabled?
            if ($item.publicNetworkAccess -eq 'Enabled') {
                [void]$resultsArray.Add($(DefineCommonModel -Pillar 'Security' -ResourceType $item.resourceType -ResourceGroup $item.resourceGroup -ResourceName $item.name -Severity 'High' -Issue 'Public network access ENABLED'))    
            }

            # Is blob public access enabled?
            if ($item.allowBlobPublicAccess -eq $True) {
                [void]$resultsArray.Add($(DefineCommonModel -Pillar 'Security' -ResourceType $item.resourceType -ResourceGroup $item.resourceGroup -ResourceName $item.name -Severity 'High' -Issue 'Blob Public access ENABLED'))    
            }
            #$modelItem = DefineCommonModel -Pillar 'pillar' -ResourceType $item.resourceType -ResourceGroup $item.resourceGroup -ResourceName $item.name -Severity $item.impact -Issue $item.problem
        
            #[void]$resultsArray.Add($modelItem)
        }
    }
}