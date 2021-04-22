#!/bin/bash

source activate wzjMap

seqkit grep -f material.list /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa > material.fa
seqkit grep -f material.list /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/07_show_readDepth_Ab_region/03_show_mapping_read/mapped.fa >> material.fa
seqkit grep -f material.list /public1/home/sc30797/wangzijian/update_Mo17/01_evalue_gap_size/01_evalue_TAG/ONT/03_over150K_fail_read/close.read.fa >> material.fa
seqkit fx2tab -nl material.fa | awk '{print $1"\t"$NF}' - > material.fa.len
minimap2 -t 64 -cx ava-ont material.fa material.fa > material_self.paf