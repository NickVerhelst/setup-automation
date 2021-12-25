# The software works with the following config files:
- packages-to-install-choco.txt: A list of packages that are installed via chocolatey.
- packages-to-install-windows.txt: A list of packages that are installed via Windows.
- vscode-libraries.txt: A list of VSCode libraries to install.
# The different PowerShell scripts are ran in the specified order:
- check-config-files.ps1: Checks if the config files are in the correct output format.
- install-chocolatey.ps1: Installs the latest version of chocolatey via PowerShell (needed for next step).
- fresh-install.ps1: Installs packages for fresh computer install using chocolatey (via the choco command).
- install-vscode-libraries.ps1: Installs the different VSCode libraries via PowerShell (requires VSCode installed via previous command).