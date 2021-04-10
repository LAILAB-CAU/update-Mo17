#!/bin/bash
thepath=/public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2
for x in ${thepath}/*.fastq.bam.infor
do
perl prepare_for_draw_mapping.pl ${x} chr4_gap 4+16800000+17400000 30000
done

sort chr4_gap.kar | uniq - > chr4_gap.kar.uniq
sort chr4_gap.bed | uniq - > chr4_gap.bed.uniq
rm chr4_gap.kar
rm chr4_gap.bed
mv chr4_gap.kar.uniq chr4_gap.kar
mv chr4_gap.bed.uniq chr4_gap.bed

cat /public1/home/sc30797/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/Mo17_almostComplete/rm_for_draw.hl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/ShowReadsMapping/mappedReads/mapped_reads_rm_fordraw.hl > chr4_gap.hl

highlight=
perl /public1/home/sc30797/wangzijian/scripts/draw_mapping.pl  chr4_gap.bed chr4_gap.kar chr4_gap.hlt chr4_gap.coor
