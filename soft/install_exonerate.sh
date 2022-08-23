#!/bin/bash

LRSDAY_HOME=$(pwd)
EXONERATE_VERSION=$1
EXONERATE_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

exonerate_dir="${build_dir}/exonerate-${EXONERATE_VERSION}-x86_64/bin"
if [ -z $(check_installed ${exonerate_dir}) ]; then
    cd ${build_dir}
    echo "Download exonerate-v${EXONERATE_VERSION}"
    download_and_extract ${EXONERATE_DOWNLOAD_URL} "exonerate-${EXONERATE_VERSION}-x86_64.tar.gz"
    note_installed ${exonerate_dir}
fi

cd ${LRSDAY_HOME}

echo "export exonerate_dir=${exonerate_dir}" >> env.sh

echo "EXONERATE DONE!"
