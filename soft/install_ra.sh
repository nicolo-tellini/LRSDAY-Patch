#!/bin/bash

LRSDAY_HOME=$(pwd)

source ${LRSDAY_HOME}/soft/common.sh
RA_DOWNLOAD_URL=$1

ra_dir="${build_dir}/ra/build/bin"
if [ -z $(check_installed $ra_dir) ]; then
    cd ${build_dir}
    git clone --recursive ${RA_DOWNLOAD_URL}
    cd ra
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release .. 
    make -j ${MAKE_JOBS}
    note_installed ${ra_dir}
fi

cd ${LRSDAY_HOME}

echo "export ra_dir=${ra_dir}" >> env.sh

echo "RA DONE!"
