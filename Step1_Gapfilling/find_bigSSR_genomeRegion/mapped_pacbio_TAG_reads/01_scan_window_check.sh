#!/bin/bash
set -e
set -u
awk '{if($4 == "TAG")print $0}' ~/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/Mo17_almostComplete/rm_for_draw.bed > Mo17.almostComplete.TAG.bed
bedtools makewindows -g ~/wangzijian/update_Mo17/00_assembly/merge_nanopore_pacbio/Mo17.almostComplete.fa.len -w 20000 -s 10000 > Mo17.almostComplete.w20k.bed
bedtools intersect -a Mo17.almostComplete.w20k.bed -b Mo17.almostComplete.TAG.bed -wo > Mo17.almostComplete.w20k.TAG.bed
perl find_over10kTAG.pl Mo17.almostComplete.w20k.TAG.bed over10KTAG.bed