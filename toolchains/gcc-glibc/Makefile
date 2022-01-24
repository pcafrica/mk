SHELL=/bin/bash
mkFlags?=

help:
	@echo "Help:"
	@echo "  clean    remove the downloaded files and eventualy the logs"
	@echo "  install  install the gcc-glibc/11 toolchain"

clean:
	@rm -vf *.{tar.{bz2,gz,xz},zip,tgz}
	@rm -vf *.log

install:
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags)
