#!/bin/bash
for x in */*.fa.out
do
sed  '1,3d' ${x} | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' -  >> fail_read_150K.bed
done
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl fail_read_150K.bed fail_read_150K.for_draw.bed fail_read_150K.for_draw.hl

awk 'BEGIN{SUM= 0}{if(NF == 5)SUM += $3-$2+1}END{print SUM}' fail_read_150K.for_draw.bed