#!/bin/bash

LRSDAY_HOME=$(pwd)
REPEATMASKER_VERSION=$1
REPEATMASKER_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

repeatmasker_dir="${build_dir}/RepeatMasker"
if [ -z $(check_installed ${repeatmasker_dir}) ]; then
    cd ${build_dir}
    echo "Download Repeatmasker-v${REPEATMASKER_VERSION}"
    download_and_extract ${REPEATMASKER_DOWNLOAD_URL} "RepeatMasker-${REPEATMASKER_VERSION}.tar.gz"
    cd ${repeatmasker_dir}
    echo "Download and setup RepBase library"
    REPBASE_VERSION="20170127"
    wget -nv --no-check-certificate https://github.com/yjx1217/RMRB/raw/master/RepBaseRepeatMaskerEdition-${REPBASE_VERSION}.tar.gz
    tar xzf RepBaseRepeatMaskerEdition-${REPBASE_VERSION}.tar.gz
    rm RepBaseRepeatMaskerEdition-${REPBASE_VERSION}.tar.gz
    cd .. 
    note_installed ${repeatmasker_dir}
fi
PATH="${repeatmasker_dir}:${PATH}"

cd ${LRSDAY_HOME}

echo "export repeatmasker_dir=${repeatmasker_dir}" >> env.sh

echo "REPEATMASKER DONE!"
