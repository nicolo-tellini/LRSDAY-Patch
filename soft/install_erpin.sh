#!/bin/bash

LRSDAY_HOME=$(pwd)
ERPIN_VERSION=$1
ERPIN_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

erpin_dir="${build_dir}/erpin${ERPIN_VERSION}.serv/bin"
if [ -z $(check_installed ${erpin_dir}) ]; then
    cd ${build_dir}
    echo "Download ERPIN"
    download_and_extract ${ERPIN_DOWNLOAD_URL} "erpin_v${ERPIN_VERSION}.tar.gz"
    cd erpin${ERPIN_VERSION}.serv
    make -j ${MAKE_JOBS}
    note_installed ${erpin_dir}
fi

cd ${LRSDAY_HOME}

echo "export erpin_dir=${erpin_dir}" >> env.sh

echo "ERPIN DONE!"
