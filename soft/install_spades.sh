#!/bin/bash

LRSDAY_HOME=$(pwd)
SPADES_VERSION=$1
SPADES_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

spades_dir="${build_dir}/SPAdes-${SPADES_VERSION}-Linux/bin"
if [ -z $(check_installed ${spades_dir}) ]; then
    cd ${build_dir}
    echo "Download SPAdes-v${SPADES_VERSION}"
    # This sometimes times out, could this be throttling from the server?
    # Allow administrator to manually upload a copy of the tarball for installation
    if [ ! -e "SPAdes-${SPADES_VERSION}-Linux.tar.gz" ]; then
        download_and_extract ${SPADES_DOWNLOAD_URL} "SPAdes-${SPADES_VERSION}-Linux.tar.gz"
    else
        tar -zxf "SPAdes-${SPADES_VERSION}-Linux.tar.gz"
    fi
    note_installed ${spades_dir}
fi

cd ${LRSDAY_HOME}

echo "export spades_dir=${spades_dir}" >> env.sh

echo "SPADES DONE!"
