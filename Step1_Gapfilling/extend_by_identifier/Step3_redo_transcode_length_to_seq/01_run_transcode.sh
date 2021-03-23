#!/bin/bash
set -e
set -u

# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/copyIndel.bed \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/over200K/copyIndel.bed \
#  > copyIndel.bed
# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/read150KWithoutM.len /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/over200K/read200KWithoutM.len > readWithoutM.len

# awk '{print $1"\t"$2"\t"$3"\t-"}' /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/copy_reverse.named.bed > /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.R.bed
# awk '{print $1"\t"$2"\t"$3"\t+"}' /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/copy_forward.named.bed > /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.F.bed
# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.R.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.F.bed  | sort -k1,1 -k2,2n - > /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.rDNA.sorted.bed
# bedtools complement -i  /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.rDNA.sorted.bed -g /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.len | awk '{print $1"\t"$2"\t"$3"\tnon"}' - > /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.non.bed 
# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.rDNA.sorted.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.non.bed | sort -k1,1 -k2,2n - > /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2_composition.sorted.bed


# cat ../Step2_transcode_length_to_seq/readWithoutM.len  /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2.len > rDNAseq.len
cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/reads_composition.sorted.bed    /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/lasm2_composition.sorted.bed > rDNAseq_composition.sorted.bed
python filter_read_length_for_bed.py  rDNAseq.len rDNAseq_composition.sorted.bed > rDNAseq.indel.bed
perl transcode.pl rDNAseq.len rDNAseq.indel.bed 50 ReadsCodeR50.fa
perl transcode.pl rDNAseq.len rDNAseq.indel.bed 100 ReadsCodeR100.fa
perl transcode.pl rDNAseq.len rDNAseq.indel.bed 200 ReadsCodeR200.fa
perl transcode.pl rDNAseq.len rDNAseq.indel.bed 500 ReadsCodeR500.fa
