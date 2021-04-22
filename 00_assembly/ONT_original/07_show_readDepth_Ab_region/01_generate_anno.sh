#!/bin/bash

cp /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/03_hifiasm_contigs_to_replace/Mo17_ont_origin_asm/Mo17_ont_origin_asm.out .
awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' Mo17_ont_origin_asm.out > rm.out.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl  rm.out.bed Mo17_ont_origin_asm.for_draw.bed Mo17_ont_origin_asm.for_draw.hl 
perl changeContigNameHl.pl Mo17_ont_origin_asm.for_draw.hl changed_name_Mo17_ont_origin_asm.for_draw.hl
