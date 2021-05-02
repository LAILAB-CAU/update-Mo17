#!/bin/bash

awk '$1~/chr1$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr1.filter
awk '$1~/chr2$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr2.filter
awk '$1~/chr3$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr3.filter
awk '$1~/chr4$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr4.filter
awk '$1~/chr5$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr5.filter
awk '$1~/chr6$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr6.filter
awk '$1~/chr7$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr7.filter
awk '$1~/chr8$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr8.filter
awk '$1~/chr9$/'  Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr9.filter
awk '$1~/chr10$/' Mo17.final.polish.fa.filtered.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr10.filter

awk '$1~/chr1$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr1.origin
awk '$1~/chr2$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr2.origin
awk '$1~/chr3$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr3.origin
awk '$1~/chr4$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr4.origin
awk '$1~/chr5$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr5.origin
awk '$1~/chr6$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr6.origin
awk '$1~/chr7$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr7.origin
awk '$1~/chr8$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr8.origin
awk '$1~/chr9$/'  Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr9.origin
awk '$1~/chr10$/' Mo17.final.polish.fa.original.10k.depth.bed | awk '{if($4<=300){print $1"\t"$2"\t"$3"\t"$4;}else{print $1"\t"$2"\t"$3"\t300"}}' | sort -k1,1 -k2,2n - > Depth.chr10.origin

Rscript plot_v2.R