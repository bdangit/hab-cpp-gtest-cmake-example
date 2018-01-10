pkg_name=cpp-gtest-cmake-example
pkg_origin=bdangit
pkg_version=0.1.0
pkg_license=('MIT')
pkg_build_deps=(
  core/gcc
  core/cmake
  core/make
  core/pkg-config
  bdangit/googletest
  bdangit/googlemock
)
pkg_deps=(
  core/glibc
  core/gcc-libs
)

pkg_bin_dirs=(bin)

BUILDDIR='build'

do_prepare() {
  rm -rf "${BUILDDIR}"
}

do_build() {
  mkdir -p "${BUILDDIR}"
  cmake -H./ \
    -B${BUILDDIR} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}"
  make -C "${BUILDDIR}" VERBOSE=${DEBUG}
}

do_check() {
  # this export is to make `testfoo` binary happy
  # need to figure out how to maniuplate RPATH of `testfoo` to include googletest and googlemock
  # at buildtime.  Either set $ENV{LD_RUN_PATH} or use `core/pathelf` to modify the rpath
  # export LD_LIBRARY_PATH
  # LD_LIBRARY_PATH="$(pkg_path_for bdangit/googletest)/lib;$(pkg_path_for bdangit/googlemock)/lib"
  # LD_LIBRARY_PATH="$(pkg_path_for bdangit/googlemock)/lib"
  #
  # build_line "Plan Setting LD_LIBRARY_PATH=${LD_LIBRARY_PATH}"

  make -C "${BUILDDIR}" test
}

do_install() {
  make -C "${BUILDDIR}" install
}
