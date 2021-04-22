#!/bin/bash

source activate wzjMap

minimap2 -t 64 -ax map-pb -N50 -r 1000 /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa hifi_reads.fa  |samtools view -bS - > might_other_SSR.hifiread.bam

perl /public1/home/sc30797/wangzijian/scripts/map/get_the_detailed_mapping_information_from_bwa_bam_file.pl might_other_SSR.hifiread.bam 0 > might_other_SSR.hifiread.bam.infor