#!/bin/bash

LRSDAY_HOME=$(pwd)

source ${LRSDAY_HOME}/soft/common.sh

if [ ! -e "${build_dir}/cpanm" ]; then
    mkdir -p  ${build_dir}/cpanm
    cd  ${cpanm_dir}
    wget --no-check-certificate -O - https://cpanmin.us/ > cpanm
    chmod +x cpanm
    mkdir -p perlmods
fi

xargs -a "${LRSDAY_HOME}/perldeps" ${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed || (echo "Could not install some Perl modules. See logs for failures" && exit 1)
if [ ! -z "$USE_POSTGRES" ]; then
    
    # need $POSTGRES_HOME pre-defined
    ${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed DBD::Pg
else
    ${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed DBD::SQLite@1.54
fi

${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed Want
${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed Inline::C
${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed forks::shared
${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed Perl::Unsafe::Signals
${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed IO::All
${cpanm_dir}/cpanm -l ${cpanm_dir}/perlmods --notest --skip-installed forks

export PATH=${cpanm_dir}/perlmods:${PATH}
