function Install-Drivers {
    Import-Module PSWindowsUpdate
    Get-WUList -IsDriver:$true -IsInstalled:$false | Install-WindowsUpdate -AcceptAll
}
