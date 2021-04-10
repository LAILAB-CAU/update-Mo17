#!/bin/bash
set -e
set -u

contig20=/public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/03_hifiasm_contigs_to_replace/Mo17_ont_origin_asm.fa
ontAsmChangedName=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa

perl changeContigName.pl ${contig20} ${ontAsmChangedName}