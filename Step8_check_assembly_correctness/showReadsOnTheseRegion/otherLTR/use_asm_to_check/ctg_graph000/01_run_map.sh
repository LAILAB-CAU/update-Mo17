#!/bin/bash
set -e 
set -u 

minimap2 -t 64 -cx asm5 -f 0.02 ~/wangzijian/update_Mo17/00_assembly/merge_nanopore_pacbio/Mo17.almostComplete.fa ~/wangzijian/update_Mo17/nextdenovo_assmbly/ctg_graph000/nextgraph.assembly.contig.fasta > ctg_graph000.paf
