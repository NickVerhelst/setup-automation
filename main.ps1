# Importing the different modules
Import-Module ./src/read-configs.psm1
Import-Module ./src/install-choco-packages.psm1
Import-Module ./src/install-microsoft-store-packages.psm1
# Running the script
Write-Output "Setting the Execution Policy to RemoteSigned."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
# We first read all the packages that will be installed
Write-Output "Reading Choco packages to install ..."
$chocoFileName = 'choco-packages.txt'
$chocoPackagesToInstall = (Read-ConfigFile -fileName "$($chocoFileName)")
Write-Output "Found following packages to install via Chocolatey: $($chocoPackagesToInstall)"
Write-Output "Reading Microsoft store packages to install ..."
$microsoftStoreFileName = 'microsoft-store-packages.txt'
$microsoftStorePackagesToInstall = (Read-ConfigFile -fileName "$($microsoftStoreFileName)")
Write-Output "Found following packages to install via Chocolatey: $($microsoftStorePackagesToInstall)"
# Next we install all the packages
Write-Output "Installing Chocolatey packages ..."
Install-ChocoPackages -packagesToInstall "$($chocoPackagesToInstall)"
Write-Output "Installing Microsoft Store packages ..."
Install-MicrosoftStorePackages -packagesToInstall "$($microsoftStorePackagesToInstall)"
Read-Host -Prompt "Press Enter to exit"