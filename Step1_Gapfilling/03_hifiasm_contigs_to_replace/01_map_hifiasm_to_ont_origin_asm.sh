#!/bin/bash
set -e
set -u

ont=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/nanopore_final_clean/01_anchor_and_orient/Mo17.genome.nextpolish.forward.20contig.fa
# deal with ont
seqkit grep -v -p Contig5_chr1 ${ont} > Mo17_ont_origin_asm.fa
samtools faidx ${ont} Contig5_chr1:477538-57825833  | seqkit seq -s -w 0 - > right.fa
sed -i '1 i >Contig5_chr1_valid' right.fa
cat right.fa >> Mo17_ont_origin_asm.fa
rm right.fa

ontRef=Mo17_ont_origin_asm.fa
hifiasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/assembly_result/Mo17.p_ctg.fa
hifiasm_foward=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/Mo17.p_ctg.sort.forward.fa

# minimap2 -t64 -f 0.02 -cx asm5 ${ontRef} ${hifiasm} > ontContig_hifiasmContig.paf
minimap2 -t64 -f 0.02 -cx asm5 ${ontRef} ${hifiasm_foward} > ontContig_hifiasmContig_forward.paf
