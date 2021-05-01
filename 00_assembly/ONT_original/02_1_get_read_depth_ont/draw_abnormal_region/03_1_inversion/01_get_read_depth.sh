#!/bin/bash
# grep Contig  /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/09_map_ont_pb_asm/01_show_regions/03_1_inversion/karyoInver | sort | uniq - > 1inver.bed
# sort -k1,1 -k2,2n 1inver.bed > 1inver.bed.sorted
# split -l 1 -d 1inver.bed.sorted 
for x in x*
do
bedtools intersect -a /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.filtered.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.${x}.filter
done
for x in x*
do
bedtools intersect -a /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.original.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.${x}.origin
done