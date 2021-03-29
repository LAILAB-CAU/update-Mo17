#!/bin/bash

set -e
set -u 


cp /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/find_bigSSR_genomeRegion/lass/toDraw.fa  gap_boundary.fa
samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/pier3/all_pier.fa page20 >> gap_boundary.fa 
samtools faidx ~/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa 0c37ee39-bdd6-4ddc-a4ce-a5a9f46a699a >> gap_boundary.fa
awk '{if(NF > 4)print $1"\t"$2"\t"$3}' /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/find_bigSSR_genomeRegion/lass/toDraw/toDraw.fa.rm.bed > ssr.bed
grep 'page20' /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/pier3/all_pier/rm_for_draw.bed | awk '{if(NF > 4)print $1"\t"$2"\t"$3}'  - >> ssr.bed
grep '0c37ee39-bdd6-4ddc-a4ce-a5a9f46a699a' ~/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa.split/rm_for_draw.bed | awk '{if(NF > 4)print $1"\t"$2"\t"$3}'  - >> ssr.bed

cp /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/pier7/Step1_merge_new_pier/mask.pl .
seqtk seq -M ssr.bed gap_boundary.fa > gap_boundary_lowcase.fa 
perl mask.pl gap_boundary_lowcase.fa >>gap_boundary_masked.fa