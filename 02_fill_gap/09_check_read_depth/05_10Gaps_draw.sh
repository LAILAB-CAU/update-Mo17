#!/bin/bash

split -l1 -d --additional-suffix .bed Final_10Gaps.bed     Gap
split -l1 -d --additional-suffix .bed Final_13Coverage.bed Coverage
split -l1 -d --additional-suffix .bed Final_1Inver.bed     Inversion

for x in Coverage*.bed
do
bedtools intersect -a Mo17.final.polish.fa.filtered.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > ${x}.filter
bedtools intersect -a Mo17.final.polish.fa.original.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > ${x}.origin
done


for x in Gap*.bed
do
bedtools intersect -a Mo17.final.polish.fa.filtered.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > ${x}.filter
bedtools intersect -a Mo17.final.polish.fa.original.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > ${x}.origin
done


for x in Inversion*.bed
do
bedtools intersect -a Mo17.final.polish.fa.filtered.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > ${x}.filter
bedtools intersect -a Mo17.final.polish.fa.original.1k.depth.bed -b ${x} -wa | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > ${x}.origin
done

# Rscript plot_v3.R