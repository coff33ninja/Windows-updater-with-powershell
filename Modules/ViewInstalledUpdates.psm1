function View-InstalledUpdates {
    Import-Module PSWindowsUpdate
    Get-WUHistory
}
