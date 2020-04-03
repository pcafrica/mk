# How to use
## Download
| Package name | Description | Size |
|-----------------|--------------|------|
| [<kbd>mk-2020.0.tar.gz</kbd>](https://polimi365-my.sharepoint.com/:u:/g/personal/10366794_polimi_it/EQiuYxn1JadMoKflUH07Rs8Bd3Q_sWPd_dCsXXDiK3FL-g?e=opoDWm&download=1) | toolchain only | 189MB |
| [<kbd>mk-2020.0-base.tar.gz</kbd>](https://polimi365-my.sharepoint.com/:u:/g/personal/10366794_polimi_it/EWzabd5oCmtCuc-HHB-C9n8BySqT4MdOgJmxEYLcqwXZLA?e=k8YDR7&download=1) | + base packages | 434MB |
| [<kbd>mk-2020.0-lifex.tar.gz</kbd>](https://polimi365-my.sharepoint.com/:u:/g/personal/10366794_polimi_it/EZnMgW5dP0tEmH0gzh9McgABsi82pk-N3eJkru9wIQ3guw?e=0mWPgd&download=1) | + <kbd>life<sup>x</sup></kbd> dependencies (<kbd>deal.II</kbd> and <kbd>VTK</kbd>) | 934MB |
| [<kbd>mk-2020.0-full.tar.gz</kbd>](https://polimi365-my.sharepoint.com/:u:/g/personal/10366794_polimi_it/Eft6FinLtIxDnLD7LNpYPr4BYG7t5yNzmtmnc2mmimfOtQ?e=BfzJ8e&download=1) | + extra software (including <kbd>Octave</kbd>, <kbd>R</kbd> and <kbd>Fenics</kbd>) | 1.2GB


## Install
Extract the downloaded archive with:
```bash
sudo tar xzvf archive-name.tar.gz -C /
```

Add the following lines to your `.bashrc` file (or equivalent):
```bash
# mk.
export mkPrefix=/u/sw
source ${mkPrefix}/etc/profile
module load gcc-glibc
module load package_name
```
and restart the shell.

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
