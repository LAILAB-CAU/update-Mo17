#!/bin/bash
set -u 
set -e 


assembly=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/merge_nanopore_pacbio/Mo17.almostComplete.fa
pacbio=/public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/contigs.fa
minimap2 -t 64 -cx map-ont -r 10000 $assembly candidate.fa > candidate.asm.paf
minimap2 -t 64 -cx map-ont -r 10000 $pacbio   candidate.fa > candidate.pac.paf