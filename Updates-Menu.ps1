# Install PSWindowsUpdate module
Install-Module PSWindowsUpdate -Force

# Import required modules
Import-Module "$PSScriptRoot\Modules\ViewInstalledUpdates.psm1"
Import-Module "$PSScriptRoot\Modules\InstallWindowsUpdates.psm1"
Import-Module "$PSScriptRoot\Modules\InstallOptionalUpdates.psm1"
Import-Module "$PSScriptRoot\Modules\InstallDrivers.psm1"
Import-Module "$PSScriptRoot\Modules\DeferUpdates.psm1"
Import-Module "$PSScriptRoot\Modules\UninstallUpdates.psm1"

# Define function to display menu
function Show-Menu {
    Clear-Host
    Write-Host "Windows Update CLI Menu"
    Write-Host "1. View installed updates"
    Write-Host "2. Install Windows updates"
    Write-Host "3. Install optional updates"
    Write-Host "4. Install driver updates"
    Write-Host "5. Defer updates"
    Write-Host "6. Uninstall updates"
    Write-Host "7. Exit"
}

# Define function to get user input
function Get-Choice {
    $validInput = $false
    while (-not $validInput) {
        $choice = Read-Host "Enter your choice [1-7]"
        if ($choice -ge 1 -and $choice -le 7) {
            $validInput = $true
        }
        else {
            Write-Host "Invalid choice. Please enter a number between 1 and 7."
        }
    }
    return $choice
}

# Display menu and get user input
do {
    Show-Menu
    $choice = Get-Choice
    switch ($choice) {
        1 {
            $updates = View-InstalledUpdates
            if ($updates.Count -eq 0) {
                Write-Host "No updates found."
            }
        }
        2 {
            $updates = Install-WindowsUpdates
            if ($updates.Count -eq 0) {
                Write-Host "No updates found."
            }
        }
        3 {
            $updates = Install-OptionalUpdates
            if ($updates.Count -eq 0) {
                Write-Host "No updates found."
            }
        }
        4 {
            $updates = Install-Drivers
            if ($updates.Count -eq 0) {
                Write-Host "No updates found."
            }
        }
        5 {
            $days = Read-Host "Enter number of days to defer updates for"
            Defer-Updates -days $days
        }
        6 {
            $updates = Uninstall-Updates
            if ($updates.Count -eq 0) {
                Write-Host "No updates found."
            }
        }
    }
    if ($choice -ne 7) {
        Write-Host "Press any key to return to the menu..."
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
} until ($choice -eq 7)
