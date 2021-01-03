# How to use
1. Download [latest release](https://github.com/elauksap/mk/releases).
2. Extract the downloaded archive with:
```bash
sudo tar xzvf mk-version.tar.gz -C /
```
3. Add the following lines to your `.bashrc` file (or equivalent):
```bash
# mk.
export mkPrefix=/opt/mk
source ${mkPrefix}/etc/profile
module load gcc-glibc
module load package_name
```
4. Restart the shell.

Use `module avail` or `module spider` to check the available packages.
