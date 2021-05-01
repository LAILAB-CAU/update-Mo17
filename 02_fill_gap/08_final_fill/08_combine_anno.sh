#!/bin/bash
for x in {1..10}
do
sed 1,3d chr${x}/chr${x}.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' - >> Mo17.final.polish.fa.rm.bed
done
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl Mo17.final.polish.fa.rm.bed Mo17.final.polish.for_draw.bed Mo17.final.polish.for_draw.hl
cat Mo17.final.polish.for_draw.hl fill_region.for_draw.hl > highlight.txt