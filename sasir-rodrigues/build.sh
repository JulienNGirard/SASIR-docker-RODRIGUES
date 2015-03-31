#!/bin/bash -ve

PACKAGES="SASIR-library LWimager-SASIR"
GITHUB_URL="https://github.com/JulienNGirard/"
BUILD_ROOT="/build/"


mkdir -p ${BUILD_ROOT}

for PACKAGE in ${PACKAGES}; do
    PACKAGE_DIR="${BUILD_ROOT}${PACKAGE}/"
    PACKAGE_REPO="${GITHUB_URL}${PACKAGE}/"

    if [ ! -d "${PACKAGE_DIR}" ]; then
        git clone ${PACKAGE_REPO} ${PACKAGE_DIR}
    else
        pushd ${PACKAGE_DIR}
            git pull
        popd
    fi
done

# build and install SASIR
mkdir -p  ${BUILD_ROOT}SASIR-library/build
pushd ${BUILD_ROOT}SASIR-library/build
    cmake ..
    make -j 4
    make install
    cd ..
    ./install
popd

# build and install LWimager
mkdir -p  ${BUILD_ROOT}LWimager-SASIR/build
pushd ${BUILD_ROOT}LWimager-SASIR/build
    cmake -DLIB_EXTRA_SYNTHESIS=gfortran -DBUILD_ALL=1 -DBUILD_SHARED_LIBS=ON ..
    make -j 4
    make install
popd
