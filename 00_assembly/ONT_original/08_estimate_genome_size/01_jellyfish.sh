#!/bin/bash

read450_r1=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_450bp_TAGCTT_L00M_R1_001_clean.fastq.gz
read450_r2=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_450bp_TAGCTT_L00M_R2_001_clean.fastq.gz
read800_r1=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_800bp_GGCTAC_L002_R1_001_clean.fastq.gz
read800_r2=/public1/home/sc30797/wangzijian/data/Mo17_CAU1/Mo17_800bp_GGCTAC_L002_R2_001_clean.fastq.gz

/public1/home/sc30797/wangzijian/software/jellyfish count -t 32  -m 17 -s 5G -C <(zcat ${read450_r1}) <(zcat ${read450_r2}) <(zcat ${read800_r1}) <(zcat ${read800_r2})
/public1/home/sc30797/wangzijian/software/jellyfish dump  -c -t mer_counts.jf > kmer_count.tsv 
/public1/home/sc30797/wangzijian/software/jellyfish stats mer_counts.jf > mer_counts.stats
/public1/home/sc30797/wangzijian/software/jellyfish histo mer_counts.jf > kmer_hist.tsv