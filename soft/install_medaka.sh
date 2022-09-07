#!/bin/bash

LRSDAY_HOME=$(pwd)
MEDAKA_VERSION=$1

source ${LRSDAY_HOME}/soft/common.sh

medaka_dir="${build_dir}/medaka/bin"
if [ -z $(check_installed ${medaka_dir}) ]; then
    cd ${build_dir}
    echo "Donwload and install medaka-"${MEDAKA_VERSION}
    virtualenv medaka --python=python3 --prompt "(medaka) "
    . medaka/bin/activate
    pip install medaka
    deactivate
    note_installed ${medaka_dir}
    medaka_dir="${build_dir}/conda_medaka_env/bin"
fi

cd ${LRSDAY_HOME}

echo "export medaka_dir=${medaka_dir}" >> env.sh

echo "MEDAKA DONE!"
