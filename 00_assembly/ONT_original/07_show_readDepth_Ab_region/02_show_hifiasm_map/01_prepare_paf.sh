#!/bin/bash

sort -k6,6 -k8,8n /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/04_hifiasm_close_5_gap/Mo17_ont_origin_asm.fahifiasmContig_forward.paf > Mo17_ont_origin_asm.fahifiasmContig_forward.paf
awk '{print $6"\t"$8"\t"$9"\t"$5"\t"$1"\t"$3"\t"$4}' Mo17_ont_origin_asm.fahifiasmContig_forward.paf > Mo17_ont_origin_asm.fahifiasmContig_forward.paf.bed
bedtools intersect -a abnormal.show.bed -b Mo17_ont_origin_asm.fahifiasmContig_forward.paf.bed -wa -wb > show_hifiasm_region.bed
