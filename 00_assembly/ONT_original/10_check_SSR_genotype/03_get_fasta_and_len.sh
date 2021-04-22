#!/bin/bash


awk '{print $4}' batch1_1.region.bed | sort | uniq - >> read.list
awk '{print $4}' batch2_1.region.bed | sort | uniq - >> read.list
awk '{print $4}' batch2_2.region.bed | sort | uniq - >> read.list
awk '{print $4}' batch3_1.region.bed | sort | uniq - >> read.list
awk '{print $4}' batch3_2.region.bed | sort | uniq - >> read.list
awk '{print $4}' batch3_3.region.bed | sort | uniq - >> read.list
awk '{print $4}' batch3_4.region.bed | sort | uniq - >> read.list
wait

source activate wzjMap
seqkit grep -f read.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/hifi_reads.fa.gz > hifi_reads.fa

seqkit fx2tab -nl hifi_reads.fa > hifi_reads.fa.len 



