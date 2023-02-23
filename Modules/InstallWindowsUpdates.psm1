function Install-WindowsUpdates {
    Import-Module PSWindowsUpdate
    Install-WindowsUpdate -AcceptAll -AutoReboot
}
