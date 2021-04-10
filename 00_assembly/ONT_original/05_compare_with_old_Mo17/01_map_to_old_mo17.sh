#!/bin/bash
source activate wzjMap
oldmo17=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Zm-Mo17-REFERENCE-CAU-1.0.chromosome.fa
ontAsmChangedName=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa
18contig=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/nanopore_final_clean/01_anchor_and_orient/Mo17.genome.nextpolish.sort.forward.18contig.fasta
samtools faidx ${18contig} Contig5 > Contig5.fa
# minimap2 -t 64 -cx asm20 -f 0.02 ${oldmo17} ${ontAsmChangedName} > old_new.paf
minimap2 -t 64 -cx asm20 -f 0.02 ${oldmo17} Contig5.fa > old_Contig5.paf