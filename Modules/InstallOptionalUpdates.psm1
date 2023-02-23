function Install-OptionalUpdates {
    Import-Module PSWindowsUpdate
    Get-WUList -IsHidden:$false -IsInstalled:$false | Install-WindowsUpdate -AcceptAll
}
