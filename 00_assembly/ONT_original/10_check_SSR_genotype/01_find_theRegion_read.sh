#!/bin/bash
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch1_1.fastq.gz.bam.infor batch1_1.bed  &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch2_1.fastq.gz.bam.infor batch2_1.bed  &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch2_2.fastq.gz.bam.infor batch2_2.bed  &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_1.fastq.gz.bam.infor batch3_1.bed  &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_2.fastq.gz.bam.infor batch3_2.bed  &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_3.fastq.gz.bam.infor batch3_3.bed  &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_4.fastq.gz.bam.infor batch3_4.bed  &

wait
