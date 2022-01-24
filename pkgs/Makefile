SHELL=/bin/bash
mkFlags?=

help:
	@echo "Help:"
	@echo "  clean    remove the downloaded files and eventualy the logs"
	@echo "  libs     install the libraries for the loaded toolchain"
	@echo "  lifex    install lifex dependencies for the loaded toolchain"
	@echo "  pyfex    install pyfex dependencies for the loaded toolchain"
	@echo "  extra    install extra packages for the loaded toolchain"
	@echo "  install  install the libraries, lifex dependencies and extra packages for the loaded toolchain"

clean:
	@rm -vf */*.{tar.{bz2,gz,xz},zip,tgz}
	@find . -name "*.log" -exec rm -v '{}' \;

libs:
	@test -n "${mkToolchainBase}" && test -d "${mkToolchainBase}"
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) boost
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) tbb
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) openblas
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) blacs
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) scalapack
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) arpack
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) fftw
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) glpk
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) metis
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) scotch
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) p4est
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) suitesparse
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) mumps
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) superlu
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) hypre
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) eigen
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) scipy
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) hdf5
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) netcdf
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) matio
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) petsc
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) trilinos
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) adol-c
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) gsl

lifex:
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) dealii
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) vtk

pyfex:
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) pybind11
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) dakota

extra:
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) lis
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) cgal
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) fenics
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) qhull
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) qrupdate
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) octave
	@"${mkPrefix}"/sbin/mkpkg $(mkFlags) R

install: libs lifex pyfex extra

.PHONY: help clean libs lifex pyfex extra install
