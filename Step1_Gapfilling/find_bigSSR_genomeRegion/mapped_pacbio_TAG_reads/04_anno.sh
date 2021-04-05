#!/bin/bash

RepeatMasker   -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/real_repeat.lib.fasta -gff  -dir pacbio pacbio.fa
cd pacbio/
sed  '1,3d' pacbio.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' - > pacbio.fa.rm.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type.pl pacbio.fa.rm.bed pacbio.bed pacbio.hl