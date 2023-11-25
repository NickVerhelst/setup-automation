<# READ CONFIGS
    This module file will run the installer for the choco packages.
#>
function Install-ChocoPackages{
    param(
        [string[]] $packagesToInstall,
        [string[]] $packagesSeparator = ','
    )
    foreach ($package in "$($packagesToInstall)".split("$($packagesSeparator)")) {
        Write-Host "Installing $($package)"
        choco install $package -y
    }
}
# At the end of the module we explicitly expose our function to the end users.
Export-ModuleMember -Function Install-ChocoPackages
