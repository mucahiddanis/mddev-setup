echo "Set ExecutionPolicy to Unrestricted"
Set-ExecutionPolicy Unrestricted


# User Account Control Settings Turn Of
echo "User Account Control Settings Turn Of"
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

#--- Configuring Windows properties ---
#--- Windows Features ---
# Show hidden files, Show protected OS files, Show file extensions
echo "Show hidden files, Show protected OS files, Show file extensions"
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

#--- File Explorer Settings ---
# will expand explorer to the actual folder you're in
echo "will expand explorer to the actual folder you're in"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
#adds things back in your left pane like recycle bin
echo "adds things back in your left pane like recycle bin"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
#opens PC to This PC, not quick access
echo "opens PC to This PC, not quick access"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
#taskbar where window is open for multi-monitor
echo "taskbar where window is open for multi-monitor"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

echo "Install Apps with Winget"
echo "7Zip Install"
winget install -e --id 7zip.7zip -h --accept-package-agreements
echo "NodeJS Install"
winget install -e --id OpenJS.NodeJS -h --accept-package-agreements

echo "OhMyPosh Install"
winget install -e --id JanDeDobbeleer.OhMyPosh -h --accept-package-agreements

echo "VSCode Install"
winget install -e --id Microsoft.VisualStudioCode -h --accept-package-agreements
echo "DBeaver Install"
winget install -e --id dbeaver.dbeaver -h --accept-package-agreements

echo "Postman Install"
winget install -e --id Postman.Postman -h --accept-package-agreements
echo "Chrome Install"
winget install -e --id Google.Chrome -h --accept-package-agreements
echo "Notion Install"
winget install -e --id Notion.Notion -h --accept-package-agreements
echo "PowerToys Install"
winget install -e --id Microsoft.PowerToys -h --accept-package-agreements
echo "AnyDesk Install"
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk -h --accept-package-agreements
echo "Notepad++ Install"
winget install -e --id Notepad++.Notepad++ -h --accept-package-agreements

echo "wsl Install"
wsl --install

echo "Restart PC"