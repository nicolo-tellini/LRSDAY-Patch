#!/bin/bash

LRSDAY_HOME=$(pwd)
MARGINPOLISH_VERSION=$1
MARGINPOLISH_DOWNLOAD_URL=$2
MARGINPOLISH_GITHUB_COMMIT_VERSION=$3
SUSE=$4

source ${LRSDAY_HOME}/soft/common.sh

marginpolish_dir="${build_dir}/marginPolish/build"
if [ -z $(check_installed ${marginpolish_dir}) ]; then
    cd ${build_dir}
    echo "Download MarginPolish-v${MARGINPOLISH_VERSION}"
    git clone --recursive ${MARGINPOLISH_DOWNLOAD_URL}
    cd marginPolish
    #git checkout -f -q ${MARGINPOLISH_GITHUB_COMMIT_VERSION}
    git submodule update --init
    mkdir build
    cd build
    cmake ..
    
    if [ $SUSE == "yes" ]
    then
    sed -i 's/\-O3/\-O3 \-lm \-ldl/g' ../CMakeLists.txt 
    fi
    
    make
    note_installed ${marginpolish_dir}
fi

cd ${LRSDAY_HOME}

echo "export marginpolish_dir=${marginpolish_dir}" >> env.sh

echo "MARGINPOLISH DONE!"
