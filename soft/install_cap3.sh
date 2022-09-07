#!/bin/bash

LRSDAY_HOME=$(pwd)
CAP_DOWNLOAD_URL=$1
FILE=$2

source ${LRSDAY_HOME}/soft/common.sh

cap_dir="${build_dir}/CAP3"
if [ -z $(check_installed ${cap_dir}) ]; then
    cd ${build_dir}
    download_and_extract ${CAP_DOWNLOAD_URL} ${FILE}
    note_installed ${cap_dir}
fi

cd ${LRSDAY_HOME}

echo "export cap_dir=${cap_dir}" >> env.sh

echo "CAP3 DONE!"
