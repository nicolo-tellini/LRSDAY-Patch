#!/bin/bash

LRSDAY_HOME=$(pwd)

MAKER_VERSION=$1
MAKER_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

maker_dir="${build_dir}/maker-Version_3.01.02_r1162/bin"
if [ -z $(check_installed $maker_dir) ]; then
    cd ${build_dir}
    echo "Download MAKER"
   download_and_extract ${MAKER_DOWNLOAD_URL} Version_3.01.02_r1162.tar.gz
    cd ${build_dir}/maker-Version_3.01.02_r1162/src/
    cp ${LRSDAY_HOME}/misc/maker_Build.PL .
    echo "no"|perl maker_Build.PL
    ./Build install
    note_installed ${maker_dir}
fi
cd ${LRSDAY_HOME}

echo "export maker_dir=${maker_dir}" >> env.sh

echo "MAKER DONE!"
