#!/bin/bash


pbhifiasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/Mo17.p_ctg.sort.forward.fa
samtools faidx ${pbhifiasm} ptg000148l > ptg000148l.fa

source activate LTR_retrieve
export PATH=/public1/home/sc30797/kevin/software/genometools-install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_Finder-master/source/:$PATH
export PATH=/public1/home/sc30797/kevin/software/blast+/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/hmmer-3.3.2/install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_retriever-master/:$PATH

RepeatMasker   -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/final_repeat.lib.fasta -gff  -dir ptg000148l ptg000148l.fa
cd ptg000148l/
sed  '1,3d' ptg000148l.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' - > ptg000148l.fa.rm.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl ptg000148l.fa.rm.bed ptg000148l.bed ptg000148l.hl
# perl /public1/home/sc30797/wangzijian/scripts/drawContigRepeat.pl ../ptg000148l.fa.len ptg000148l.hl