#!/bin/bash


ont=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/nanopore_final_clean/01_anchor_and_orient/Mo17.genome.nextpolish.forward.20contig.fa
polish=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/nanopore_final_clean/new_all/all.fa
# deal with ont


samtools faidx ${ont} Contig5_chr1:1-477538   > TAG_g2_2.fa
samtools faidx ${polish} ctg000377_np12121212 >> TAG_g2_2.fa
samtools faidx TAG_g2_2.fa
awk '{print $1"\t"$2}' TAG_g2_2.fa.fai > TAG_g2_2.fa.len
source activate LTR_retrieve
export PATH=/public1/home/sc30797/kevin/software/genometools-install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_Finder-master/source/:$PATH
export PATH=/public1/home/sc30797/kevin/software/blast+/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/hmmer-3.3.2/install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_retriever-master/:$PATH
RepeatMasker  -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/real_repeat.lib.fasta -gff  -dir TAG_g2_2 TAG_g2_2.fa
sed  '1,3d' TAG_g2_2/TAG_g2_2.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' -  > TAG_g2_2.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl TAG_g2_2.bed TAG_g2_2.for_draw.bed TAG_g2_2.for_draw.hl
perl /public1/home/sc30797/wangzijian/scripts/drawContigRepeat.pl TAG_g2_2.fa.len TAG_g2_2.for_draw.hl

