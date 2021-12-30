# Import the package via a relative path
$relativePath = '../src/read-configs.psm1'
$modulePath = (Join-Path "$($PSScriptRoot)" "$($relativePath)")
Import-Module $modulePath
# Run the function with the test parameters below
$parsedConfigFile = (Read-ConfigFile -pathToFile ".testdata" -fileName "packages-to-install-choco.txt")
$parsedConfigFile
