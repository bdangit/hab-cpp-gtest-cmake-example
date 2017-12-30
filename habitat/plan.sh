pkg_name=cpp-gtest-cmake-example
pkg_origin=bdangit
pkg_version=0.1.0
pkg_license=('MIT')
pkg_build_deps=(
  core/gcc
  core/cmake
  core/make
  core/openssl
)
pkg_deps=(
  core/glibc
  core/gcc-libs
)

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
  make -C "${BUILDDIR}"
}

do_check() {
  make -C "${BUILDDIR}" test
}

do_install() {
  make -C "${BUILDDIR}" install
}
