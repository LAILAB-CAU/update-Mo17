#!/bin/bash
source activate wzjMap


read800_2=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_800bp_GGCTAC_L002_R2_001.fastq.gz
read800_1=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_800bp_GGCTAC_L002_R1_001.fastq.gz
read450_2=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_450bp_TAGCTT_L00M_R2_001.fastq.gz
read450_1=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_450bp_TAGCTT_L00M_R1_001.fastq.gz


bwa index TAG.fa
bwa mem -t 64 TAG.fa ${read800_1} ${read800_2} | samtools view -bS - > pcrfree_800ToTAG.bam
bwa mem -t 64 TAG.fa ${read450_1} ${read450_2} | samtools view -bS - > pcrfree_450ToTAG.bam
perl ~/wangzijian/scripts/map/get_the_detailed_mapping_information_from_bwa_bam_file.pl pcrfree_800ToTAG.bam 0 > pcrfree_800ToTAG.bam.infor
perl ~/wangzijian/scripts/map/get_the_detailed_mapping_information_from_bwa_bam_file.pl pcrfree_450ToTAG.bam 0 > pcrfree_450ToTAG.bam.infor