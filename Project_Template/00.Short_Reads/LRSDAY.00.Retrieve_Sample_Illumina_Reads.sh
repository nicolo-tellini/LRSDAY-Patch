#!/bin/bash

set -e -o pipefail

#######################################
# load environment variables for LRSDAY
source ./../../env.sh

#######################################
# This scripts download PE short reads.
sra_id="SRR4074258" # the SRA Run ID for the reads that you want to retrieve, e.g. "SRR4074258 for S. cerevisiae strain SK1 generated by Yue et al. (2017) Nature Genetics"

#######################################
# process the pipeline
echo "retrieve reads by the SRR_id: $sra_id ..."

proj=${sra_id:0:6}
last=${sra_id: -1}

# Please run the following two wget commands to directly download the reads.
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${proj}/00${last}/${sra_id}/${sra_id}_1.fastq.gz 
ln -s ${sra_id}_1.fastq.gz ${sra_id}_pass_1.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${proj}/00${last}/${sra_id}/${sra_id}_2.fastq.gz
ln -s ${sra_id}_2.fastq.gz ${sra_id}_pass_2.fastq.gz

############################
# checking bash exit status
if [[ $? -eq 0 ]]
then
    echo ""
    echo "LRSDAY message: This bash script has been successfully processed! :)"
    echo ""
    echo ""
    exit 0
fi
############################
