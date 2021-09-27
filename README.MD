**How to Setup?**

Open Windows Terminal or Power Shell with Run as Admin

    Set-ExecutionPolicy Unrestricted

If you are running PowerShell v3 or higher:

    . { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force

If you are running PowerShell v2:

    iex ((New-Object System.Net.WebClient).DownloadString('https://boxstarter.org/bootstrapper.ps1')); Get-Boxstarter -Force

Invoke the the Install-BoxstarterPackage command pointing to your gist created above:

Install-BoxstarterPackage -PackageName 

    https://gist.githubusercontent.com/mucahiddanis/81eef9cb01ed99b07720e4820911d892/raw/4f13506baf1b62b799a06327b1723e74214d56e0/mddev-setup.txt -DisableReboots

Set Default ExecutionPolicy

    Set-ExecutionPolicy Restricted
