#!/bin/bash

perl drawContigRepeat.pl unmapped_pacbio_TAG_reads.ssr.ratio.sorted /public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/pacbio_minimap2/pacbio.unmapped.reads.fa.split/pacbio.unmapped.for_draw.hl &
perl drawContigRepeat.pl mapped_pacbio_TAG_reads.ssr.ratio.sorted /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/mapped_pacbio_TAG_reads/onlyTAG/pacbio/pacbio.fa.for_draw.hl &
wait