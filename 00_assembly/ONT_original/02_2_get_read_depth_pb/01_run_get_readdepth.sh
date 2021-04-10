#!/bin/bash
set -u 
set -e 

echo -e "run get_mapped_bed.pl\n"
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch1_1.fastq.gz.bam.infor batch1_1.mapped.bed batch1_1.maybemapped.bed &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch2_1.fastq.gz.bam.infor batch2_1.mapped.bed batch2_1.maybemapped.bed &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch2_2.fastq.gz.bam.infor batch2_2.mapped.bed batch2_2.maybemapped.bed &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_1.fastq.gz.bam.infor batch3_1.mapped.bed batch3_1.maybemapped.bed &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_2.fastq.gz.bam.infor batch3_2.mapped.bed batch3_2.maybemapped.bed &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_3.fastq.gz.bam.infor batch3_3.mapped.bed batch3_3.maybemapped.bed &
perl get_mapped_bed.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/01_2_mappb/batch3_4.fastq.gz.bam.infor batch3_4.mapped.bed batch3_4.maybemapped.bed &
wait

echo -e "combine all cell .bed files\n"
cat \
batch1_1.mapped.bed \
batch2_1.mapped.bed \
batch2_2.mapped.bed \
batch3_1.mapped.bed \
batch3_2.mapped.bed \
batch3_3.mapped.bed \
batch3_4.mapped.bed \
| sort -k1,1 -k2,2n - > allCellMapped.bed &

cat \
batch1_1.maybemapped.bed \
batch2_1.maybemapped.bed \
batch2_2.maybemapped.bed \
batch3_1.maybemapped.bed \
batch3_2.maybemapped.bed \
batch3_3.maybemapped.bed \
batch3_4.maybemapped.bed \
| sort -k1,1 -k2,2n - > allCellMaybeMapped.bed &
wait

rm *.maybemapped.bed *.mapped.bed


echo -e "run bedtools genomecov\n"
bedtools genomecov -i allCellMapped.bed      -g /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa.len -bga -split > Mo17_ont_origin_asm.fa.filtered.depth.bed
bedtools genomecov -i allCellMaybeMapped.bed -g /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa.len -bga -split > Mo17_ont_origin_asm.fa.original.depth.bed