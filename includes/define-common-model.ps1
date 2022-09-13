function DefineCommonModel{
    param(
        [string]$Pillar,
        [string]$ResourceType,
        [string]$ResourceGroup,
        [string]$ResourceName,
        [string]$Severity,
        [string]$Issue 
        )
    $o = New-Object PsObject
    $o | Add-Member NoteProperty Pillar $Pillar  # operational, security, performance, cost
    $o | Add-Member NoteProperty ResourceType $ResourceType # For eg. MICROSOFT.NETWORK/VIRTUALNETWORKS
    $o | Add-Member NoteProperty ResourceGroup $ResourceGroup
    $o | Add-Member NoteProperty ResourceName $ResourceName
    $o | Add-Member NoteProperty Severity $Severity
    $o | Add-Member NoteProperty Issue $Issue

    return $o

    }