SHELL=/bin/bash

help:
	@echo "Help:"
	@echo "  clean    remove the downloaded files and eventualy the logs"
	@echo "  install  install the gcc-glibc/9 toolchain"

install:
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) --options="11"

clean:
	@rm -vf *.{tar.{bz2,gz,xz},zip,tgz}
	@rm -vf *.log
