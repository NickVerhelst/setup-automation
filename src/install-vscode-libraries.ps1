# Set-ExecutionPolicy Bypass -Scope Process -Force; 
$relativePath = '../src/read-configs.psm1'
$modulePath = (Join-Path "$($PSScriptRoot)" "$($relativePath)")
$librariesSeparator = ","
Import-Module $modulePath
$pathToConfigs = './testfiles'
$fileName = 'test-vscode-libraries.txt'
$librariesToInstall = (Read-ConfigFile -pathToFile "$($pathToConfigs)" -fileName "$($fileName)" -packagesSeparator "$($librariesSeparator)")
foreach ($library in "$($librariesToInstall)".split("$($librariesSeparator)")) {
    Write-Host "Setting up library $($package)"
    code --install-extension $library
}
