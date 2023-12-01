# Automated setup
The scripts in this package aim to automate the installation of software on a freshly installed computer.

In order to facilitate the automation capabilities, we use the chocolatey package manager. Note that alternatives exist (e.g. scoop). You are free to re-use the code here and use a different installer.

## Requirements
In order to run the script, you should open PowerShell as an admin and allow an elevated ExcecutionPolicy: `Set-ExecutionPolicy ByPass -Scope Process -Force`.

By adding the scope `Process`, you ensure that the elevated rights are gone when your PowerShell session ends. The `-Force` tag is needed as windows will sometimes complain about the policies.

Chocolatey should also be installed BEFORE running the `main.ps1` script. If this has not happened yet, you can use the `install-chocolatey.ps1` script. This script should also be ran with elevated rights.

## Running the script

To run the script, you simply update the files in the configs and run the main.ps1 script.

## Configs

The config files are just a flat listing of the packages by name or ID as they can be found in:
- Chocolatey (alias 'choco')
- The Microsoft Store

Packages outside of these providers are not in scope of this script.

## Disclaimer

The installer wil automatically accept all EULA prompts that are thrown.

If you include packages, it is your personal responsibility to check whether you agree with these.
