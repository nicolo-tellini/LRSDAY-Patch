#!/bin/bash

LRSDAY_HOME=$(pwd)
SHASTA_VERSION=$1
SHASTA_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

shasta_dir="${build_dir}/shasta-${SHASTA_VERSION}"
if [ -z $(check_installed ${shasta_dir}) ]; then
    cd ${build_dir}
    echo "Download Shasta-v${SHASTA_VERSION}"
    mkdir shasta-${SHASTA_VERSION}
    cd shasta-${SHASTA_VERSION}
    wget ${SHASTA_DOWNLOAD_URL}
    chmod ugo+x shasta-Linux-${SHASTA_VERSION}
    ln -s shasta-Linux-${SHASTA_VERSION} shasta
    note_installed ${shasta_dir}
fi

cd ${LRSDAY_HOME}

echo "export shasta_dir=${shasta_dir}" >> env.sh

echo "SHASTA DONE!"
