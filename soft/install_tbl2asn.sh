#!/bin/bash

LRSDAY_HOME=$(pwd)
TBL2ASN_DOWNLOAD_URL=$1

source ${LRSDAY_HOME}/soft/common.sh

tbl2asn_dir="${build_dir}/tbl2asn_dir"
if [ -z $(check_installed ${tbl2asn_dir}) ]; then
    cd ${build_dir}
    echo "Download tbl2asn"
    download ${TBL2ASN_DOWNLOAD_URL} "tbl2asn.gz"
    mkdir tbl2asn_dir
    gunzip tbl2asn.gz
    chmod 755 tbl2asn
    mv tbl2asn ./tbl2asn_dir/
    note_installed ${tbl2asn_dir}
fi

cd ${LRSDAY_HOME}

echo "export tbl2asn_dir=${tbl2asn_dir}" >> env.sh

echo "TBL2ASN DONE!"
