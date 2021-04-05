#!/bin/bash
set -u 
set -e 

RepeatMasker   -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/real_repeat.lib.fasta -gff  -dir repeat candidate.fa
cd repeat/
sed  '1,3d' candidate.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' - > candidate.fa.rm.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type.pl candidate.fa.rm.bed candidate.reads.bed candidate.reads.hl