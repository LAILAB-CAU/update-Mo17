#!/bin/bash
set -e
set -u 

minimap2 -t 64 -cx asm5 -f 0.02 ~/wangzijian/update_Mo17/00_assembly/merge_nanopore_pacbio/Mo17.almostComplete.fa ~/wangzijian/update_Mo17/00_assembly/assembly_result/Mo17.p_ctg.fa > hifiasm.paf 
minimap2 -t 64 -cx asm5 -f 0.02 ~/wangzijian/update_Mo17/00_assembly/merge_nanopore_pacbio/Mo17.almostComplete.fa ~/wangzijian/update_Mo17/00_assembly/assembly_result/Mo17.contigs.fasta > canu.paf 