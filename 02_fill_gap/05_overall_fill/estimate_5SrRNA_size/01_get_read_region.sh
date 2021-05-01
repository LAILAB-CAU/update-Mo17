#!/bin/bash

# perl -ne 'chomp;next if(/^#/);@a=split(/\s+/,$_); if($a[9] >= $a[8]){print "$a[1]\t$a[8]\t$a[9]\n";}else{print "$a[1]\t$a[9]\t$a[8]\n";}' 5SrRNA.blast.ont.txt | sort -k1,1 -k2,2n - > 5SrRNA.blast.ont.bed
# perl -ne 'chomp;next if(/^#/);@a=split(/\s+/,$_); if($a[9] >= $a[8]){print "$a[1]\t$a[8]\t$a[9]\n";}else{print "$a[1]\t$a[9]\t$a[8]\n";}' 5SrRNA.blast.txt     | sort -k1,1 -k2,2n - > 5SrRNA.blast.pb.bed
# perl count_Illumina_length.pl  Mo17_450bp.bam.infor  Mo17_450bp.R1.bed Mo17_450bp.R2.bed
# perl count_Illumina_length.pl  Mo17_800bp.bam.infor  Mo17_800bp.R1.bed Mo17_800bp.R2.bed

awk 'BEGIN{SUM=0}{SUM += $3-$2}END{print SUM}' 5SrRNA.blast.ont.bed > ont_5SrRNA.stat
awk 'BEGIN{SUM=0}{SUM += $3-$2}END{print SUM}' 5SrRNA.blast.pb.bed > pb_5SrRNA.stat
awk 'BEGIN{SUM=0}{SUM += $3-$2}END{print SUM}' Mo17_450bp.R1.bed >  Illumina_450bp_5SrRNA.stat
awk 'BEGIN{SUM=0}{SUM += $3-$2}END{print SUM}' Mo17_450bp.R2.bed >> Illumina_450bp_5SrRNA.stat
awk 'BEGIN{SUM=0}{SUM += $3-$2}END{print SUM}' Mo17_800bp.R1.bed >  Illumina_800bp_5SrRNA.stat
awk 'BEGIN{SUM=0}{SUM += $3-$2}END{print SUM}' Mo17_800bp.R2.bed >> Illumina_800bp_5SrRNA.stat