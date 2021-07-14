SHELL=/bin/bash
mkFlags?=

help:
	@echo "Help:"
	@echo "  clean    remove the downloaded files and eventualy the logs"
	@echo "  install  install the base package for the loaded toolchain"

clean:
	@rm -vf */*.{tar.{bz2,gz,xz},zip,tgz}
	@find . -name \*.log -exec rm -v '{}' \;
	@rm -vf readline/readline??-???
	@rm -vf bash/bash??-???
	@rm -vf openssl/certdata.txt

install:
	@test -n "${mkToolchainBase}" && test -d "${mkToolchainBase}"
	#@rm -rf "${mkToolchainBase}"/*
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) make
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) diffutils
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) findutils
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) sed
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) m4
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libtool
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) gettext
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libiconv
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) flex
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) bison
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) db
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) gdbm
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) perl
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) gmp
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) mpdecimal
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) mpfr
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) mpc
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) autoconf
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) automake
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) pkgconf
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) lcov
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) ncurses
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) readline
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) gawk
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) bash
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) zlib
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) gzip
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) bzip2
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) xz
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) tar
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) texinfo
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) pcre
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) pcre2
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) grep
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libffi
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) expat
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) sqlite
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) openssl
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libssh2
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) openssh
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) python
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) lua
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) tcl
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) sphinx
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) icu
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libxml2
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libidn2
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) curl
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libarchive
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) ninja
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) cmake
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) subversion
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) git
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) mercurial
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) vim
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) emacs
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) htop
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) gdb
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) libnl
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) hwloc
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) openmpi
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) valgrind
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) openmpi
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) patchelf
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) chrpath
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags)
