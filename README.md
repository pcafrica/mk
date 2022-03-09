# How to use
1. Download [latest release](https://github.com/elauksap/mk/releases).
2. Extract the archive just downloaded with:
```bash
sudo tar xzvf mk-version.tar.gz -C /
```
3. Add the following lines to your `.bashrc` file (or equivalent):
```bash
# mk.
export mkPrefix=/u/sw/
source ${mkPrefix}/etc/profile
module load gcc-glibc
module load package_name
```
4. Restart the shell.

Use `module avail` or `module spider` to check the available packages.

## Docker
A `Docker` image built upon [`Ubuntu`](https://hub.docker.com/_/ubuntu)
(`x86-64` architecture) with `mk` installed is available
[here](https://hub.docker.com/r/elauksap/mk).
