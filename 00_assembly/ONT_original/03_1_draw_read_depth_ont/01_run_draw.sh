#!/bin/bash

source activate wzjMap
genome=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa.len
filteredDepth=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.filtered.1k.depth.bed
originalDepth=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.original.1k.depth.bed

# awk '{if($4<100)print $1"\t"$2"\t"$3"\tred"}' ${filteredDepth} > abnomalRegion.bed
awk '{print $1"\t0\t"$2}' ${genome} > genome.bed
# perl drawContigDepth.pl genome.bed abnomalRegion.bed ${filteredDepth} ${originalDepth}
perl drawContigDepthLine.pl genome.bed ${filteredDepth} ${originalDepth}