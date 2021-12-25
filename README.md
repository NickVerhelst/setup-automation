# Automated setup
The scripts in this package aim to automate the installation of software on a freshly installed computer.

# Requirements
In order to run the software, the following config files should be present:
- packages-to-install-choco.txt: A list of packages that are installed via chocolatey.
- packages-to-install-windows.txt: A list of packages that are installed via Windows.
- vscode-libraries.txt: A list of VSCode libraries to install.

In order to generalize the names, I am working on a general config file where you can just point to the locations.

# Usage
For a first version, the different powershell scripts should be ran in the order outlined below.

1. check-config-files.ps1: Checks if the config files are in the correct output format.
2. install-chocolatey.ps1: Installs the latest version of chocolatey via PowerShell (needed for next step).
3. fresh-install.ps1: Installs packages for fresh computer install using chocolatey (via the choco command).
4. install-vscode-libraries.ps1: Installs the different VSCode libraries via PowerShell (requires VSCode installed via previous command).


# TODO: 
- Combine all logic in a central `main.ps1` script that will scan the main config file and do the required appropriate actions on its own. 
- In the centralized script, we can log the different steps and its process.

Other ideas for scripts to add:
- Automate Windows setting setup (might require automated detection of windows version)
  - Dark Mode by default
  - Do not disturb by default
  - Start menu setup (on the left)
  - Pinned programs to the start bar?
  - Background setup (add files to this set)
- Automate VSCode package setup/installation
- Automate Outlook settings setup
- Automate installation of Anaconda environments (loop trough environments folder)
  - For this we can again provide a folder containing the different anaconda environments.
  - Install environments using conda
  - Report on installation during the process

