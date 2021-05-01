#!/bin/bash
source activate LTR_retrieve
export PATH=/public1/home/sc30797/kevin/software/genometools-install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_Finder-master/source/:$PATH
export PATH=/public1/home/sc30797/kevin/software/blast+/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/hmmer-3.3.2/install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_retriever-master/:$PATH
RepeatMasker  -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/final_repeat.lib.fasta -gff  -dir fill_region fill_region.fa
sed 1,3d fill_region/fill_region.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' - >> fill_region.fa.rm.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl fill_region.fa.rm.bed fill_region.for_draw.bed fill_region.for_draw.hl
