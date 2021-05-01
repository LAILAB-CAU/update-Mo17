#!/bin/bash

# bwa index /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/05_overall_fill/Mo17.final.fa

# bwa mem -t 64 /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/05_overall_fill/Mo17.final.fa \
#  /public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_450bp_TAGCTT_L00M_R1_001_clean.fastq.gz \
#  /public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_450bp_TAGCTT_L00M_R2_001_clean.fastq.gz \
#  | samtools view - > Mo17_450bp.bam
# samtools view -bS Mo17_450bp.sam > Mo17_450bp.bam
# perl ~/wangzijian/scripts/map/get_the_detailed_mapping_information_from_bwa_bam_file.pl Mo17_450bp.bam 0 > Mo17_450bp.bam.infor 

# bwa mem -t 64 the_5SrRNA.fa \
#  /public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_800bp_GGCTAC_L002_R1_001_clean.fastq.gz \
#  /public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_800bp_GGCTAC_L002_R2_001_clean.fastq.gz \
#  | samtools view -bS - > Mo17_800bp.bam
perl get_the_detailed_mapping_information_from_bwa_bam_file.pl Mo17_800bp.bam 0 > Mo17_800bp.bam.infor
wait
