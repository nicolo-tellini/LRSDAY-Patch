#!/bin/bash

LRSDAY_HOME=$(pwd)
SRA_VERSION=$1
SRA_DOWNLOAD_URL=$2
mainland_china_installation="no"

source ${LRSDAY_HOME}/soft/common.sh

sra_dir="${build_dir}/sratoolkit.${SRA_VERSION}-centos_linux64/bin"
if [ -z $(check_installed ${sra_dir}) ]; then
    cd ${build_dir}
    echo "Download SRAtoolkit-v${SRA_VERSION}"
    download_and_extract ${SRA_DOWNLOAD_URL} sratoolkit.${SRA_VERSION}-centos_linux64.tar.gz
    note_installed ${sra_dir}
fi

cd ${LRSDAY_HOME}

echo "export sra_dir=${sra_dir}" >> env.sh

echo "SRA DONE!"
