param(
  $OutputFile = "./azure-discovery.csv"
)

# [Parameter(Mandatory = $true)]
# $principalName
# )

# Include all the functions we need
. "$PSScriptRoot\includes\startup-info.ps1"  # Simple startup ionfo to display
. "$PSScriptRoot\includes\advisor-recommendations.ps1"   # Advisor recommendations - easy stuff

# Kick it off
$account = StartupInfo
$advisor = GetAdvisorRecommendations
