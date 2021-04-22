#!/bin/bash
source activate LTR_retrieve
export PATH=/public1/home/sc30797/kevin/software/genometools-install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_Finder-master/source/:$PATH
export PATH=/public1/home/sc30797/kevin/software/blast+/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/hmmer-3.3.2/install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_retriever-master/:$PATH
cat rDNA_asm.fa >> material.fa
RepeatMasker  -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/real_repeat.lib.fasta -gff  -dir material  material.fa
cd material
sed  '1,3d' material.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' -  > material.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl material.bed material.for_draw.bed material.for_draw.hl