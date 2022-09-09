function StartupInfo() {
    $account = az account show | ConvertFrom-Json
    Write-Host "Discovering tenancy details for subscription: '$($account.name)':$($account.id)"
    Write-Host "Output File: $outputFile"
    return $account    
}