#!/bin/bash

source activate wzjMap
genome=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa.len
filteredDepth=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.filtered.1k.depth.bed
originalDepth=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/02_1_get_read_depth_ont/Mo17_ont_origin_asm.fa.original.1k.depth.bed


perl find_abnormal_region_depth.pl ${filteredDepth} ${originalDepth} 100
perl drawContigDepthLineAB.pl genome.bed ${filteredDepth}ab ${originalDepth}ab