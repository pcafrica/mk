SHELL=/bin/bash

help:
	@echo "Help:"
	@echo "  clean    remove the downloaded files and eventualy the logs"
	@echo "  install  install all the gcc-glibc toolchains combinations"

install:
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) --options="4.9"
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) --options="5"
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) --options="6"
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) --options="7"

clean:
	@rm -vf *.{tar.{bz2,gz,xz},zip,tgz}
	@rm -vf *.log
