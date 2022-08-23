#!/bin/bash

LRSDAY_HOME=$(pwd)
TRNASCAN_VERSION=$1
TRNASCAN_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

trnascan_root="${build_dir}/tRNAscan-SE-${TRNASCAN_VERSION}"
trnascan_dir="${trnascan_root}/bin"
PERL5LIB=${trnascan_dir}:${PERL5LIB}
if [ -z $(check_installed ${trnascan_dir}) ]; then
    cd ${build_dir}
    echo "Download tRNAscan-SE-v${TRNASCAN_VERSION}"
    download_and_extract ${TRNASCAN_DOWNLOAD_URL} "tRNAscan-SE-${TRNASCAN_VERSION}.tar.gz"
    cd ${trnascan_root}
    mkdir bin
    mkdir -p lib/tRNAscan-SE
    mkdir -p man
    cp ${LRSDAY_HOME}/misc/tRNAscan-SE.Makefile Makefile
    make -j ${MAKE_JOBS} BINDIR="${trnascan_root}/bin" LIBDIR="${trnascan_root}/lib/tRNAscan-SE" MANDIR="${trnascan_root}"
    make install BINDIR="${trnascan_root}/bin" LIBDIR="${trnascan_root}/lib/tRNAscan-SE" MANDIR="${trnascan_root}"
    note_installed ${trnascan_dir}
fi

cd ${LRSDAY_HOME}

echo "export trnascan_dir=${trnascan_dir}" >> env.sh

echo "TRNASCAN DONE!"
