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

## Retrying an install

> Unfortunately Chocolatey has not yet implemented a retry feature.

You can easily retry an install manually by updating the config files to contain the packages you want to retry. When re-running the `main.ps1` file the packages are retried for install.

## A possible Chocolatey issue

Chocolatey is open-source and maintained by its users. This means that it can occur that packages are in need of an active maintainer and can start to lag behind. This is especially true for older operating systems (e.g. Windows 10 can already sometimes lag behind).

A typical error that occurs is that hashes will no longer match: A newer version is released but the maintainer forgot to update the hash.

To fix this issue you can re-run the choco command manually by adding the `--ignorechecksum` flag. This is not done by default as the checksum holds great security benefits.

> I would not encourage this fix on the first try. Please perform several retries before resorting to this tactic.

## Compatibility

These scripts have been tested on both Windows 10 and 11.
