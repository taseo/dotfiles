## GNU Stow

Package directories are organized in a way that duplicates them in the HOME directory. It allows the use of GNU Stow to manage symlinks between the HOME directory and this repository.

For each package in the repository that needs to be symlinked, run `stow <package>`. Use the `--adopt` flag if the package already exists on the machine and needs to be overwritten.

