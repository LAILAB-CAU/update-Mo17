#!/bin/bash

source activate LTR_retrieve
export PATH=/public1/home/sc30797/kevin/software/genometools-install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_Finder-master/source/:$PATH
export PATH=/public1/home/sc30797/kevin/software/blast+/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/hmmer-3.3.2/install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_retriever-master/:$PATH
RepeatMasker  -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/real_repeat.lib.fasta -gff  -dir Contig4_read Contig4_read.fa
sed  '1,3d' Contig4_read/Contig4_read.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' -  > Contig4_read.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl Contig4_read.bed Contig4_read.for_draw.bed Contig4_read.for_draw.hl
# perl /public1/home/sc30797/wangzijian/scripts/drawContigRepeat.pl other_LTR.fa.len.uniq other_LTR.for_draw.hl
