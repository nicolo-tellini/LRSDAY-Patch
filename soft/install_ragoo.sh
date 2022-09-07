#!/bin/bash

LRSDAY_HOME=$(pwd)
RAGOO_VERSION=$1
RAGOO_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

ragoo_dir="${build_dir}/py3_virtualenv_ragoo/bin"
if [ -z $(check_installed ${ragoo_dir}) ]; then
    cd ${build_dir}
    virtualenv -p python3.8 py3_virtualenv_ragoo
    source py3_virtualenv_ragoo/bin/activate
    echo "Download RaGOO-v${RAGOO_VERSION}"
    cd py3_virtualenv_ragoo

    download_and_extract ${RAGOO_DOWNLOAD_URL} RaGOO-${RAGOO_VERSION}.tar.gz
 
    cd RaGOO-${RAGOO_VERSION}
    pip3 install numpy
    python3.8 setup.py install 
    deactivate
    note_installed ${ragoo_dir}
fi

cd ${LRSDAY_HOME}

echo "export ragoo_dir=${ragoo_dir}" >> env.sh

echo "RAGOO DONE!"
