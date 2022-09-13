param(
  $OutputFile = "./azure-discovery.csv"
)

# [Parameter(Mandatory = $true)]
# $principalName
# )

# Include all the functions we need
. "$PSScriptRoot\includes\startup-info.ps1"  # Simple startup ionfo to display
. "$PSScriptRoot\includes\define-common-model.ps1"   # The object we place all the results in to query
. "$PSScriptRoot\includes\advisor-recommendations.ps1"   # Advisor recommendations - easy stuff
. "$PSScriptRoot\includes\get-storage-accounts-info.ps1"   # Storage accounts

$resultsArray = [System.Collections.ArrayList]::new()

# Kick it off
$account = StartupInfo
$advisor = GetAdvisorRecommendations($resultsArray)

$resultsArray
