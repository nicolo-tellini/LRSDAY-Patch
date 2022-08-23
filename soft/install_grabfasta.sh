#!/bin/bash

LRSDAY_HOME=$(pwd)
GRAB_FASTA_DOWNLOAD_URL=$1
GRAB_FASTA_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

grab_fasta_dir="${build_dir}/grab-fasta"
if [ -z $(check_installed ${grab_fasta_dir}) ]; then
    cd ${build_dir}
    echo "Download grab-fasta"
    git clone ${GRAB_FASTA_DOWNLOAD_URL}
    cd grab-fasta
    git checkout -f -q ${GRAB_FASTA_GITHUB_COMMIT_VERSION}
    note_installed ${grab_fasta_dir}
fi

cd ${LRSDAY_HOME}

echo "export grab_fasta_dir=${grab_fasta_dir}" >> env.sh

echo "GRAB FASTA DONE!"
