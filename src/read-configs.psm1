<# READ CONFIGS
    This module file contains all required functions for reading in the config files.
#>
function Read-ConfigFile{
    param(
        [string[]] $pathToFile = './configs/',
        [string[]] $fileName,
        [string[]] $commentSymbol = '#',
        [string[]] $packagesSeparator = ','
    )
    $today = (Get-Date -Format "yyyyMMdd")
    $logName = "$($today)$($fileName)"
    $fullPathToFile = (Join-Path "$($pathToFile)" "$($fileName)")
    foreach ($line in Get-Content -Path $fullPathToFile) {
        $lineToAdd = $line
        # We remove blank lines (can be placeholders)
        $keepLine = $lineToAdd.trim() -ne ""
        # We remove comment lines (starting with comment or blank spece)
        $lineToAdd = $lineToAdd | Select-String -Pattern "^[$($commentSymbol)]" -NotMatch
        # We also remove comments AFTER a package by looking for the comment symbol
        $positionOfComment = "$($lineToAdd)".IndexOf("$($commentSymbol)")
        if ($positionOfComment -gt 0) {
            $lineToAdd = "$($lineToAdd)".Substring(0, $positionOfComment)
        }
        # Finaly we trim all whitespaces and concatenate the different packages
        if ($lineToAdd.length -gt 0) {
            $lineToAdd = "$($lineToAdd)".trim()
            $lineToAdd = "$($lineToAdd)$($packagesSeparator)"
        }
        if ($keepLine) {
        $lines += $lineToAdd
        }
    }
    # At the end we clean up the trailing comma from the last package.
    return $lines.Substring(0, $lines.length-1)
}
# At the end of the module we explicitly expose our function to the end users.
Export-ModuleMember -Function Read-ConfigFile
