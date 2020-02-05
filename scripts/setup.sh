#!/bin/bash

# configuration
# =============================================================================
mk_version=1.0
URL=https://s3.eu-west-2.amazonaws.com/mk-binaries
ARCH=$(arch)
PREFIX=/u/sw
PKGS="
  arpack-3.4.0
  blacs-1.1
  boost-1.63
  cgal-4.9
  dealii-8.4.1
  eigen-3.3.3
  fenics-1.6.0
  fftw-3.3.6
  glpk-4.61
  hdf5-1.8.18
  hypre-2.11.2
  lis-1.7.28
  matio-1.5.10
  metis-5
  mumps-5.0.2
  netcdf-4.4.1.1
  octave-4.2.1
  openblas-0.2.19
  p4est-2.0
  petsc-3.6.3
  qhull-2015.2
  qrupdate-1.1.2
  R-3.3.3
  scalapack-2.0.2
  scipy-1.12.1
  scotch-6.0.4
  suitesparse-4.5.4
  superlu-5
  tbb-2017
  trilinos-12.6.3
"

# setting up temporary directory
# =============================================================================
TMPDIR=$(mktemp -d)
pushd $TMPDIR &> /dev/null
chmod 777 $TMPDIR

# local functions
# =============================================================================
error() {
  echo "$@" 1>&2
}

download() {
  local url=$1
  local output=$2
  [[ -z "$output" ]] && output=$(basename $url)
  case "$1" in
    http*|ftp*)
      wget --no-check-certificate $url -O $output;;
    *)      error "Unknown protocol for '$1'"; exit 1;;
  esac
}

version() {
  echo "Installation script for mk (version $mk_version)"
}

# parse command line arguments
# =============================================================================
while true; do
  case "$1" in
    -v|--version) version; exit 0;;
    *)            break;;
  esac
  shift
done

# fix the system
# =============================================================================
hash dialog &> /dev/null
if [[ $? -ne 0 ]]; then
  sudo apt-get install dialog &> /dev/null
fi
sudo sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

# setting the traps
# =============================================================================
die() {
  local signal=$1; shift
  local tmpdir=$2; shift
  rm -rf $tmpdir &> /dev/null || true
  error "Aborting... ($signal)"

  trap - "$signal"
  kill "-$signal" "$$"
}
error_exit() {
  local tmpdir=$1; shift
  rm -rf "$tmpdir"

  trap - EXIT
  exit 1
}
for signal in EXIT TERM HUP QUIT; do
  trap "die $signal $TMPDIR" "$signal"
done
trap "error_exit $TMPDIR" ERR

# check if arch is available
# =============================================================================
case ${ARCH} in
  x86_64)
    ;;
  *)
    echo "Unsupported architecture: ${ARCH}"
    exit 1
    ;;
esac

# setup destination directory
# =============================================================================
if [[ ! -d /u/sw ]]; then
  sudo su - << EOF
  userdel swadmin &> /dev/null
  groupdel swadmin &> /dev/null
  useradd -M -U swadmin
  usermod -L swadmin
  install -o swadmin -g swadmin -d $PREFIX
  echo "ALL ALL=(swadmin) NOPASSWD:ALL" > /etc/sudoers.d/mk
  chmod 400 /etc/sudoers.d/mk
EOF

  # Download mk package
  # =========================================================================
  download ${URL}/${ARCH}/mk.tar.bz2
  sudo -u swadmin tar -xjf ${PWD}/mk.tar.bz2 -C /

  # Configure user
  # =========================================================================
  if ! grep -q "mk modules" ~/.bashrc; then
    cat >> ~/.bashrc << EOF

# mk modules
if [[ -f /u/sw/etc/bash.bashrc ]]; then
. /u/sw/etc/bash.bashrc
fi
EOF
  fi
fi

# download and install the requested components
# =============================================================================
dialog --checklist "Choose toolchains:" 11 60 4 \
  "gcc-glibc-4.9" "304MB + 650MB" off \
  "gcc-glibc-5"   "320MB + 657MB" on  \
  "gcc-glibc-6"   "330MB + 661MB" off \
  "gcc-glibc-7"   "334MB + 658MB" off 2> ANSWER
TOOLCHAINS=$(<ANSWER)
rm ANSWER
for toolchain in ${TOOLCHAINS}; do
  filename=${toolchain}.tar.bz2
  download ${URL}/${ARCH}/${filename}
  sudo -u swadmin tar -xjf ${filename} -C /

  for pkg in ${PKGS}; do
    filename=${pkg}.tar.bz2
    download ${URL}/${ARCH}/${toolchain}/${filename}
    sudo -u swadmin tar -xjf ${filename} -C /
  done
done

# cleaning
# =============================================================================
popd &> /dev/null
rm -rf $TMPDIR
trap - EXIT
exit 0
