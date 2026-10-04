# Full installation script for Rockstar Games Launcher and its components
# Must be run as Administrator

if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# 1. Close all Rockstar processes
Get-Process -Name "Rockstar*", "SocialClub*", "Launcher*" -ErrorAction SilentlyContinue | Stop-Process -Force

# 2. Install required dependencies (Visual C++ Redistributables and DirectX)
$vcRedistUrl = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
$vcRedistPath = "$env:TEMP\vc_redist.x64.exe"
Invoke-WebRequest -Uri $vcRedistUrl -OutFile $vcRedistPath -UseBasicParsing
Start-Process -FilePath $vcRedistPath -ArgumentList "/install /quiet /norestart" -Wait

$dxUrl = "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe"
$dxPath = "$env:TEMP\dxwebsetup.exe"
Invoke-WebRequest -Uri $dxUrl -OutFile $dxPath -UseBasicParsing
Start-Process -FilePath $dxPath -ArgumentList "/Q" -Wait

# 3. Download Rockstar Games Launcher installer
$InstallerUrl = "https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe"
$InstallerPath = "$env:TEMP\Rockstar-Games-Launcher.exe"
Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath -UseBasicParsing

# 4. Silent installation
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -NoNewWindow

# 5. Add Windows Defender exclusions
Add-MpPreference -ExclusionPath "$env:ProgramFiles\Rockstar Games" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath "$env:LOCALAPPDATA\Rockstar Games" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess "RockstarGamesLauncher.exe" -ErrorAction SilentlyContinue

# 6. Create firewall rules
New-NetFirewallRule -DisplayName "Rockstar Launcher In" -Direction Inbound -Program "$env:ProgramFiles\Rockstar Games\Launcher\RockstarGamesLauncher.exe" -Action Allow -ErrorAction SilentlyContinue
New-NetFirewallRule -DisplayName "Rockstar Launcher Out" -Direction Outbound -Program "$env:ProgramFiles\Rockstar Games\Launcher\RockstarGamesLauncher.exe" -Action Allow -ErrorAction SilentlyContinue

# 7. Launch the application
Start-Process -FilePath "$env:ProgramFiles\Rockstar Games\Launcher\RockstarGamesLauncher.exe"

# 8. Clean up temporary files
Remove-Item $vcRedistPath, $dxPath, $InstallerPath -Force -ErrorAction SilentlyContinue

Write-Host "Installation and launch completed."