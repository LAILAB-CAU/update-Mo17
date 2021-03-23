#!/bin/bash
set -e
set -u

# perl sort_reads_and_id.pl read_sort.txt coor_real_50.txt > forDraw50.txt 
# perl sort_reads_and_id.pl read_sort.txt coor_real_100.txt > forDraw100.txt
# perl sort_reads_and_id.pl read_sort.txt coor_real_200.txt > forDraw200.txt



# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/copyIndel.bed \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/over200K/copyIndel.bed \
#  > copyIndel.bed

# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/over200K/unmappedReads.hl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/unmappedReads.hl > highlight.txt
# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/over200K/copy_forward.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/copy_forward.bed > copy_forward.bed
# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/unmappedReads/over200K/copy_reverse.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/copy_reverse.bed > copy_reverse.bed
# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/Step2_transcode_length_to_seq/blast/copyIndel.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/show_rDNA_with_direction/1stLocalAsm/copyIndel.bed > copyIndel.bed
perl draw_rDNA_coor.pl rDNAseq.len highlight.txt copy_forward.bed copy_reverse.bed copyIndel.bed forDraw50.txt   &
perl draw_rDNA_coor.pl rDNAseq.len highlight.txt copy_forward.bed copy_reverse.bed copyIndel.bed forDraw100.txt  &
perl draw_rDNA_coor.pl rDNAseq.len highlight.txt copy_forward.bed copy_reverse.bed copyIndel.bed forDraw200.txt  &
wait
