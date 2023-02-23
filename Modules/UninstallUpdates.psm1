function Uninstall-Updates ($updateId) {
    Import-Module PSWindowsUpdate
    Get-WUList -IsInstalled:$true | Where-Object { $_.Title -match $updateId } | Select-Object -First 1 | Uninstall-WindowsUpdate -Confirm:$false
}
