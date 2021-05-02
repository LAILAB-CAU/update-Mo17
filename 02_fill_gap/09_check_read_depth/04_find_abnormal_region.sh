#!/bin/bash

bedtools getfasta -fi /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa -bed 1inver.bed.sorted > 1inver.fa
bedtools getfasta -fi /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa -bed 13readDepth.bed.sorted > 13readDepth.fa
bedtools getfasta -fi /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa -bed 10Gaps.bed.sorted > 10Gaps.fa

source activate wzjMap
minimap2 -t 64 -cx asm20 -f 0.02 /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa 1inver.fa     > 1inver.fa.paf
minimap2 -t 64 -cx asm20 -f 0.02 /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa 13readDepth.fa     > 13readDepth.fa.paf
minimap2 -t 64 -cx asm20 -f 0.02 /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa 10Gaps.fa     > 10Gaps.fa.paf