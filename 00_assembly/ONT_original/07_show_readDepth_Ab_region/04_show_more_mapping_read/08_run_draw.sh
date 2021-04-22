#!/bin/bash
cat Contig4_read.for_draw.hl  /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/07_show_readDepth_Ab_region/changed_name_Mo17_ont_origin_asm.for_draw.hl > ont.read.hl 



perl draw_mapping.pl Contig4_0_625893.bed       Contig4_0_625893.k        ont.read.hl   Contig4_0_625893.coor    
