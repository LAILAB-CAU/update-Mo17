#!/bin/bash
source activate wzjMap
seqkit grep -f fill.list /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa > material.fa
seqkit grep -p ctg000000 /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/Mo17_rDNA_assembly/nd.asm.fasta >> material.fa

python concate_seq.py material.fa fill.tab | seqkit seq - > rDNA_asm.fa