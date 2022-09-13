function GetStorageAccountsInfo {
    param(
        [System.Collections.ArrayList]$resultsArray
    ) 

    Write-Host "Retrieving Storage accounts information and configuration..."
    # $jsonResult = az advisor recommendation list --query '[].{sku: extendedProperties.displaySKU, category:category, impact:impact, problem: shortDescription.problem, annualSavings: extendedProperties.annualSavingsAmount, currency: extendedProperties.savingsCurrency, resourceGroup: resourceGroup, resourceType: impactedField, name: impactedValue}' | ConvertFrom-Json

    # Foreach ($item IN $jsonResult) {
    #     if ($nul -ne $item.resourceGroup -and $nul -ne $item.resourceType -and $nul -ne $item.name) {
    #         # $itemDetail = az resource show -g $item.resourceGroup -n $item.name --resource-type $item.resourceType | ConvertFrom-Json
    #         # $item.itemDetail = $itemDetail
    #         $modelItem = DefineCommonModel -Pillar 'pillar' -ResourceType $item.resourceType -ResourceGroup $item.resourceGroup -ResourceName $item.name -Severity $item.impact -Issue $item.problem
        
    #         [void]$resultsArray.Add($modelItem)
    #     }
    # }
}