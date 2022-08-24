#!/bin/bash
set -e -o pipefail
#######################################
# load environment variables for LRSDAY
source ./../../env.sh

#######################################

# set project-specific variables
prefix="SK1.SMRTCell.1 SK1.SMRTCell.2 SK1.SMRTCell.3 SK1.SMRTCell.4" # The file name prefix for the output files. For the testing example, run this script four times with the prefix of "SK1.SMRTCell.1", "SK1.SMRTCell.2", "SK1.SMRTCell.3", and "SK1.SMRTCell.4" respectively.

for i in $(echo $prefix)
do
pacbio_RSII_bax_fofn_file="./pacbio_fofn_files/$i.RSII_bax.fofn" # The fofn file containing file paths to the PacBio RSII bax reads from the same SMRT cell. If you have data from multiple SMRT cells, please run this script sepearately for each of them. Do not mix reads from different SMRT cells even though they come from the same sample. For the testing example, you can set pacbio_RSII_bax_fofn_file="./pacbio_fofn_files/$prefix.RSII_bax.fofn" to let this parameter to be automatically set up based on the prefix parameter.

#######################################
# process the pipeline

$conda_pacbio_env2/bax2bam \
    --fofn=$pacbio_RSII_bax_fofn_file \
    -o ./pacbio_fofn_files/$i.bax2bam \
    --subread \
    --pulsefeatures=DeletionQV,DeletionTag,InsertionQV,IPD,MergeQV,SubstitutionQV,PulseWidth,SubstitutionTag

cd pacbio_fofn_files
rm $i.bax2bam.scraps.bam
rm $i.bax2bam.scraps.bam.pbi
echo $(pwd)/$i.bax2bam.subreads.bam > $i.bam.fofn
cd ..

############################
# checking bash exit status
#if [[ $? -eq 0 ]]
#then
#    echo "" 
     echo "LRSDAY message: This bash script has been successfully processed the sample: $i ! :)"
#    echo ""
#    echo ""
#    exit 0
#fi
############################
done
