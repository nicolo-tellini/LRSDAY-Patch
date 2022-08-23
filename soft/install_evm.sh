#!/bin/bash

LRSDAY_HOME=$(pwd)
EVM_VERSION=$1
EVM_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

evm_dir="${build_dir}/EVidenceModeler-${EVM_VERSION}"
if [ -z $(check_installed $evm_dir) ]; then
    cd ${build_dir}
    echo "Download EvidenceModeler-v${EVM_VERSION}"
    download_and_extract ${EVM_DOWNLOAD_URL} "v${EVM_VERSION}.tar.gz"
    note_installed ${evm_dir}
fi

cd ${LRSDAY_HOME}

echo "export evm_dir=${evm_dir}" >> env.sh

echo "EVM DONE!"
