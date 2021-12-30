# Automated setup
The scripts in this package aim to automate the installation of software on a freshly installed computer.

In order to facilitate the automation capabilities, we use the chocolatey package manager. Note that alternatives exist (e.g. scoop). You are free to re-use the code here and use a different installer.

# Requirements
In order to run the software, the following config files should be present:
- packages-to-install-choco.txt: A list of packages that are installed via chocolatey.
- packages-to-install-windows.txt: A list of packages that are installed via Windows.
- vscode-libraries.txt: A list of VSCode libraries to install.

In order to generalize the names, I am working on a general config file where you can just point to the locations.

For the PowerShell scripts, note that running scripts might need you to enable the appropriate execution policy: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned`.

# Usage
For a first version, the different powershell scripts should be ran in the order outlined below.

1. check-config-files.ps1: Checks if the config files are in the correct output format. (depricated at the moment)
2. install-chocolatey.ps1: Installs the latest version of chocolatey via PowerShell (needed for next step).
3. fresh-install.ps1: Installs packages for fresh computer install using chocolatey (via the choco command). This will execute the scripts in the following order:
   1. install-chocolately.ps1 (using the "install-choco" configs).
   2. install-chocolatey.ps1 (using the "install-coco-corporate" configs).
4. install-vscode-libraries.ps1: Installs the different VSCode libraries via PowerShell (requires VSCode installed via previous command).

After the scripts, you will need to manually set up the WSL (windows subsystem for linux). In this linux environment, you can then run the appropriate Linux scripts to set up that environment:
1. update-linux-distro.sh: Updates Linux to the latest version
2. install-linux-packages.sh: Installs the different Linux packages according to the config file (to be built).


# TODO: 
- Combine all logic in a central `main.ps1` script that will scan the main config file and do the required appropriate actions on its own. 
- In the centralized script, we can log the different steps and its process.
- Add a "check configs" script to already check the script setup by default.
- Write a "post-installation" checklist to the desktop after successful completion.

Other ideas for scripts to add:
- Automate Windows setting setup (might require automated detection of windows version)
  - Dark Mode by default
  - Do not disturb by default
  - Start menu setup (on the left)
  - Pinned programs to the start bar?
  - Background setup (add files to this set)
  - If the above is not easily possible, you can also automatically generate a "checklist" in on the desktop.
- Automate VSCode package setup/installation
- Automate Outlook settings setup
- Automate installation of Anaconda environments (loop trough environments folder)
  - For this we can again provide a folder containing the different anaconda environments.
  - Install environments using conda
  - Report on installation during the process

