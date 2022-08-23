#!/bin/bash

LRSDAY_HOME=$(pwd)
MF2SQN_DOWNLOAD_URL=$1
MF2SQN_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

mf2sqn_dir="${build_dir}/Mf2sqn"
if [ -z $(check_installed ${mf2sqn_dir}) ]; then
    cd ${build_dir}
    echo "Download Mf2sqn"
    git clone ${MF2SQN_DOWNLOAD_URL}
    cd Mf2sqn
    git checkout -f -q ${MF2SQN_GITHUB_COMMIT_VERSION}
    cp qualifs.pl ${build_dir}/cpanm/perlmods/lib/perl5
    note_installed ${mf2sqn_dir}
fi

cd ${LRSDAY_HOME}

echo "export mf2sqn_dir=${mf2sqn_dir}" >> env.sh

echo "MF2SQN DONE!"
