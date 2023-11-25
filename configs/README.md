# Configs

In this folder you add the different config files to run the installer.

Two files are expected:
- `choco-packages.txt`: A list of packages to install via choco.
- `microsoft-store-packages.txt`: A list of packages to install via the Microsoft store.

Both files follow the same sturcture. Lines that start with a hash `#` are "commented out" for the script. You can use this to create a structure in your files as they grow larger (e.g. when you have many packages or want to manage different contexts).

In this folder we provide two examples to get you started.
