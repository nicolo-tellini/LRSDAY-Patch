#!/bin/bash

LRSDAY_HOME=$(pwd)
CIRCLATOR_VERSION=$1
SUSE=$2

source ${LRSDAY_HOME}/soft/common.sh

if [ $SUSE == "yes"];
then

circlator_dir="${build_dir}/miniconda3/bin"
   cd ${build_dir}
   echo "Creating local virtual python3 environment and install Circlator-v${CIRCLATOR_VERSION}"
   ${circlator_dir}/conda install -y -c bioconda mummer
   ${circlator_dir}/conda install -y -c bioconda circlator
   note_installed ${circlator_dir}

cd ${LRSDAY_HOME}

echo "export circlator_dir=${circlator_dir}" >> env.sh

echo "CIRCALTOR DONE!"
   
else

 circlator_dir="${build_dir}/py3_virtualenv_circlator/bin"
if [ -z $(check_installed ${circlator_dir}) ]; then
    cd ${build_dir}
    echo "Creating local virtual python3 environment and install Circlator-v${CIRCLATOR_VERSION}"
    virtualenv -p $(which python3) py3_virtualenv_circlator
    source py3_virtualenv_circlator/bin/activate
    py3_virtualenv_circlator/bin/pip3 install "circlator==${CIRCLATOR_VERSION}"
    deactivate
    note_installed ${circlator_dir}
fi

cd ${LRSDAY_HOME}

echo "export circlator_dir=${circlator_dir}" >> env.sh

echo "CIRCALTOR DONE!"
fi


