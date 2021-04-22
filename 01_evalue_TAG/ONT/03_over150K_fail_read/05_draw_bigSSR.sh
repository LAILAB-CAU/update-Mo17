#!/bin/bash

source activate wzjMap
for x in *.over150K.fa
do
seqkit fx2tab -nl ${x} | awk '{print $1"\t"$NF}' - >> fail_read_150K.len
done
python bigSSR.py fail_read_150K.for_draw.bed fail_read_150K.len > fail_read_150K_bigSSR.len

perl /public1/home/sc30797/wangzijian/scripts/drawContigRepeat.pl fail_read_150K_bigSSR.len fail_read_150K.for_draw.hl