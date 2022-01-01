# Set-ExecutionPolicy Bypass -Scope Process -Force; 
$relativePath = '../src/read-configs.psm1'
$modulePath = (Join-Path "$($PSScriptRoot)" "$($relativePath)")
$packagesSeparator = ","
Import-Module $modulePath
$pathToConfigs = './testfiles'
$fileName = 'test-choco-packages.txt'
$packagesToInstall = (Read-ConfigFile -pathToFile "$($pathToConfigs)" -fileName "$($fileName)" -packagesSeparator "$($packagesSeparator)")
foreach ($package in "$($packagesToInstall)".split("$($packagesSeparator)")) {
    Write-Host "Installing $($package)"
    choco install $package -y
}