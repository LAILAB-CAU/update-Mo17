#!/bin/bash

source activate wzjMap

ontAsm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa
ontread=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/07_show_readDepth_Ab_region/03_show_mapping_read/mapped.fa

minimap2 -t64 -ax map-ont -N50 -r10000 ${ontAsm} ${ontread} | samtools view -bS - > Mo17_ont_origin_asm.fa.mapped.fa.bam
perl /public1/home/sc30797/wangzijian/scripts/map/get_the_detailed_mapping_information_from_bwa_bam_file.pl Mo17_ont_origin_asm.fa.mapped.fa.bam 0 > Mo17_ont_origin_asm.fa.mapped.fa.bam.infor

perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/ShowReadsMapping/mappedReads/mapped_reads_rm.bed mapped.fa.for_draw.bed mapped.fa.for_draw.hl 