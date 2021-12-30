# Reads all packages according to set up rules:
#   Ignore lines that start with a hash or that are empty
#   Ignore hash and text thereafter
# Return a list of package names to install
$today = (Get-Date -Format "yyyyMMdd")
$pathToFile = "./.testdata/packages-to-install-choco.txt"
$pathToLog = "./logs/$($today)_chocopackages"
$commentSymbol = '#'
$packagesSeparator = ' '
$lines = ''


foreach($line in Get-Content -Path $pathToFile) {
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
$lines.Substring(0, $lines.length-2)
