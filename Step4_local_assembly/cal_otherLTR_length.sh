#!/bin/bash

# awk 'BEGIN{SUM = 0}{if($4 == "TAG")SUM += $3-$2}END{print SUM}' rm_for_draw.bed > TAG.length.txt

# awk '{if($4 == "TAG")print $1}' rm_for_draw.bed | sort | uniq - > contain_TAG_reads.list
# perl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/longerThan200K/extract_longerThan200K.pl contain_TAG_reads.list /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa.len > contain_TAG_reads.length
# awk 'BEGIN{SUM = 0}{SUM += $NF}END{print SUM}' contain_TAG_reads.length > Total_contain_TAG_reads.length.txt


# awk 'BEGIN{SUM = 0}{if($4 == "#B0C4DE")SUM += $3-$2}END{print SUM}' rm_for_draw.hl > wide_TAG.length.txt
# awk '{if($4 == "#B0C4DE")print $1}' ../rm_for_draw.hl | sort | uniq - >  wide_contain_otherLTR_reads.list
#perl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/extend_by_identifier/longerThan200K/extract_longerThan200K.pl  wide_contain_TAG_reads.list /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa.len >  wide_contain_TAG_reads.length
#awk 'BEGIN{SUM = 0}{SUM += $NF}END{print SUM}'  wide_contain_otherLTR_reads.length >  wide_Total_contain_TAG_reads.length.txt


perl check_read_repeat_length.pl \
 /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa.len \
 /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa.split/rm_for_draw.hl \
 \#B0C4DE \
 otherLTR_length.txt