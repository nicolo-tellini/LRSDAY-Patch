#!/bin/bash

LRSDAY_HOME=$(pwd)
MUMMER4_VERSION=$1
MUMMER4_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

mummer4_dir="${build_dir}/mummer-${MUMMER4_VERSION}"
if [ -z $(check_installed ${mummer4_dir}) ]; then
    cd ${build_dir}
    echo "Download mummer-v${MUMMER4_VERSION}"
    download_and_extract ${MUMMER4_DOWNLOAD_URL} "mummer-${MUMMER4_VERSION}.tar.gz"
    echo "${mummer4_dir}"
    cd ${mummer4_dir}
    ./configure
    make -j ${MAKE_JOBS}
    sed -i '1153s/$P_FORMAT/#$P_FORMAT/' mummerplot
    sed -i '1154s/$P_FORMAT/#$P_FORMAT/' mummerplot
    sed -i '1155s/$P_FORMAT/#$P_FORMAT/' mummerplot 
    note_installed ${mummer4_dir}
fi
PATH="${mummer4_dir}:${PATH}"

cd ${LRSDAY_HOME}

echo "export mummer4_dir=${mummer4_dir}" >> env.sh

echo "MUMMER DONE!"
