#!/bin/bash
# perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/onlyTAG/pacbio/pacbio.fa.rm.bed \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/onlyTAG/pacbio/pacbio.fa.for_draw.bed \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/onlyTAG/pacbio/pacbio.fa.for_draw.hl
perl find_over10kTAG.pl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/onlyTAG/pacbio.fa.len \
 /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/onlyTAG/pacbio/pacbio.fa.for_draw.bed \
 mapped_pacbio_TAG_reads.ssr.ratio



# perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/pacbio_minimap2/pacbio.unmapped.reads.fa.split/rmout.bed \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/pacbio_minimap2/pacbio.unmapped.reads.fa.split/pacbio.unmapped.for_draw.bed \
#  /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/pacbio_minimap2/pacbio.unmapped.reads.fa.split/pacbio.unmapped.for_draw.hl
 
 
perl find_over10kTAG.pl /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/pacbio_minimap2/pacbio.unmapped.reads.fa.split/contain_TAG_reads.length \
 /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/pacbio_minimap2/pacbio.unmapped.reads.fa.split/pacbio.unmapped.for_draw.bed \
 unmapped_pacbio_TAG_reads.ssr.ratio