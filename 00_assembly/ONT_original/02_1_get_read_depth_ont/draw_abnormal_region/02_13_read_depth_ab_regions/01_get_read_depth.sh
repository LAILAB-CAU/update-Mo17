#!/bin/bash
# grep Contig  /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/09_map_ont_pb_asm/01_show_regions/02_13_read_depth_ab_regions/karyoReadDepthAb | sort | uniq - > 13readDepth.bed
# sort -k1,1 -k2,2n 13readDepth.bed > 13readDepth.bed.sorted
# split -l 1 -d 13readDepth.bed.sorted 
for x in x*
do
bedtools intersect -a /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.filtered.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.${x}.filter
done
for x in x*
do
bedtools intersect -a /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.original.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.${x}.origin
done