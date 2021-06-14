# How to compile

## 1. Bootstrap
- `bootstrap/bootstrap /opt/mk`


## 2. Toolchain
See `mkpkg` for a full list of optionally parsed environment variables
(such as `mkKeepBuildDir` and `mkDebug`).
- `export mkPrefix=/opt/mk`
- `cd toolchain/gcc-glibc`
- `/opt/mk/sbin/mkpkg --options=11 --jobs=<N> [-v] .` or `make install mkFlags=<flags>`


## 3. Base
- `source /opt/mk/etc/bash.bashrc`
- `module load gcc-glibc/11`

All base packages together:
- `cd base`
- `make install mkFlags=<flags>`

One single base package:
- `cd base/package`
- `/opt/mk/sbin/mkpkg --jobs=<N> [-v] .`


## 4. Packages
- `source /opt/mk/etc/bash.bashrc`
- `module load gcc-glibc/11`

All packages together:
- `cd pkgs`
- `make install mkFlags=<flags>`

One single package:
- `cd pkgs/package`
- `/opt/mk/sbin/mkpkg --jobs=<N> [-v] .`
