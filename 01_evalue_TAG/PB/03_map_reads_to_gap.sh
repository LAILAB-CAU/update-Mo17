#!/bin/bash
source activate wzjMap
seqkit grep -f list /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/ReadsEvalueSsrSize/ref.fa > gap_ref.fa
samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa Contig4 >> gap_ref.fa
minimap2 -t 64 -cx map-pb -r 1000 gap_ref.fa /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/onlyTAG/pacbio.fa > mapped_pacbio_TAG_reads.paf
minimap2 -t 64 -cx map-pb -r 1000 gap_ref.fa /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/ssr/pacbio.fa >  mapped_pacbio_ssr_reads.paf
minimap2 -t 64 -cx map-pb -r 1000 gap_ref.fa /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/pacbio_minimap2/pacbio.unmapped.reads.fa > unmapped_pacbio_TAG_reads.paf
