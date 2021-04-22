#!/bin/bash
# cat hifi_reads.for_draw.hl  /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/07_show_readDepth_Ab_region/changed_name_Mo17_ont_origin_asm.for_draw.hl > pb.read.hl 



perl draw_mapping.pl Contig3_5200000_5220000.bed       Contig3_5200000_5220000.k        pb.read.hl   Contig3_5200000_5220000.coor    &
perl draw_mapping.pl Contig7_12810000_12850000.bed       Contig7_12810000_12850000.k        pb.read.hl   Contig7_12810000_12850000.coor &
perl draw_mapping.pl Contig9_5950000_5965000.bed       Contig9_5950000_5965000.k        pb.read.hl   Contig9_5950000_5965000.coor &
wait