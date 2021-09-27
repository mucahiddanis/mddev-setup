function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function Install-FromChocolatey {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $PackageName
    )

    choco install $PackageName --yes
}

# Install-Chocolatey

Install-FromChocolatey 'vscode'
Install-FromChocolatey 'dotnet-5.0-sdk'
# Install-FromChocolatey 'fiddler'
Install-FromChocolatey 'postman'
# Install-FromChocolatey 'linqpad'
Install-FromChocolatey 'firefox'
Install-FromChocolatey 'googlechrome'
Install-FromChocolatey 'python'
Install-FromChocolatey '7zip.install'


choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"

choco install -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"
choco install -y VirtualMachinePlatform --source="'windowsfeatures'"

RefreshEnv
wsl --set-default-version 2

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile ~/Ubuntu-20-04.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu-20-04.appx
# run the distro once and have it install locally with root user, unset password

RefreshEnv
Ubuntu2004 install --root
Ubuntu2004 run apt update
Ubuntu2004 run apt upgrade -y


Install-FromChocolatey 'docker-for-windows'
Install-FromChocolatey 'vscode-docker'


#--- Configuring Windows properties ---
#--- Windows Features ---
# Show hidden files, Show protected OS files, Show file extensions
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

#--- File Explorer Settings ---
# will expand explorer to the actual folder you're in
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
#adds things back in your left pane like recycle bin
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
#opens PC to This PC, not quick access
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
#taskbar where window is open for multi-monitor
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2
