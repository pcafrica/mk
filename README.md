# How to use
Add the following lines to your `.bashrc` file (or equivalent):
```bash
# mk.
export mkPrefix=/u/sw
source ${mkPrefix}/etc/profile
module load gcc-glibc
module load package_name
```

Use `module avail` or `module spider` to check the available packages.

# Instructions to compile

## 1. Bootstrap
- `bootstrap/bootstrap /u/sw`


## 2. Toolchain
- `export mkPrefix=/u/sw`
- `cd toolchain/gcc-glibc`
- `/u/sw/sbin/mkpkg --options=9 --jobs=<N> [-v] .`


## 3. Base
- `source /u/sw/etc/bash.bashrc`
- `module load gcc-glibc/9`

All base packages together:
- `cd base`
- `make install mkFlags=<flags>`

One single base package:
- `cd base/package`
- `/u/sw/sbin/mkpkg --jobs=<N> [-v] .`


## 4. Packages
- `source /u/sw/etc/bash.bashrc`
- `module load gcc-glibc/9`

All packages together:
- `cd pkgs`
- `make install mkFlags=<flags>`

One single package:
- `cd pkgs/package`
- `/u/sw/sbin/mkpkg --jobs=<N> [-v] .`

