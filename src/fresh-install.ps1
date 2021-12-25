# Step 0: Start timer
# STEP 1: Get all software
# STEP 2: Loop trough list
# If line starts with '#' (or if it only contains spaces): skip install command (this is a comment)
# Otherwise: run installer
# choco install <package-name> -y
# If install succeeded -> Write to "installed_packages.txt" file
# If install failed -> Write to "failed_installs.txt" file
# Increment the number of installed packages with each loop.
# STEP 3: When finished, keep window open with "succesfully installed X packages"
# Stop the timer
# Report on number of successful installs
# Report on "time needed for all installs"
# Generate a list of failed packages in the install
# Prompt user to restart computer and perform windows updates (y/n):
# 	if Y or y or blank (y is default): restart computer in 5 seconds.
#	if anything else, print "Good luck with your new install!", keep open 1 second and close.
