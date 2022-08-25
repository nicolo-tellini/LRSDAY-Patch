#!/bin/bash

LRSDAY_HOME=$(pwd)
BLAST_VERSION=$1
BLAST_DOWNLOAD_URL=$2
RMBLAST_VERSION=$3
RMBLAST_DOWNLOAD_URL=$4

source ${LRSDAY_HOME}/soft/common.sh

blast_dir="${build_dir}/ncbi-blast-${BLAST_VERSION}+/bin"
blast_matrices_dir="${build_dir}/ncbi-blast-${BLAST_VERSION}+/matrices"
if [ -z $(check_installed ${blast_dir}) ]; then
    cd ${build_dir}
    echo "Download ncbi-blast-v${BLAST_VERSION}"
    download_and_extract ${BLAST_DOWNLOAD_URL} "ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz"
    cd "ncbi-blast-${BLAST_VERSION}+"
    mkdir matrices
    cd matrices
    wget -nv --no-check-certificate ftp://ftp.ncbi.nlm.nih.gov/blast/matrices/*
    note_installed ${blast_dir}
fi

cd ${LRSDAY_HOME}

echo "export blast_dir=${blast_dir}" >> env.sh
echo "export blast_matrices_dir=${blast_matrices_dir}" >> env.sh

echo "BLAST DONE!"

rmblast_dir="${build_dir}/ncbi-rmblastn-${RMBLAST_VERSION}/bin"
if [ -z $(check_installed ${rmblast_dir}) ]; then
    cd ${build_dir}
    echo "Download ncbi-rmblastn-v${BLAST_VERSION}"
    download_and_extract ${RMBLAST_DOWNLOAD_URL} "ncbi-rmblastn-${RMBLAST_VERSION}-x64-linux.tar.gz"
    cp ${rmblast_dir}/rmblastn ${blast_dir}
    note_installed ${rmblast_dir}
fi

cd ${LRSDAY_HOME}

echo "export rmblast_dir=${blast_dir}" >> env.sh

echo "RMBLAST DONE!"
