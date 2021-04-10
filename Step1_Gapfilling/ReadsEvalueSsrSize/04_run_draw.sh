#!/bin/bash
# cat ~/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa.split/rm_for_draw.hl repeat/ref.fa.hl > highlight.txt
perl /public1/home/sc30797/wangzijian/scripts/draw_mapping.pl  30Kalign.bed 30Kalign.kar highlight.txt 30Kalign.coor

perl /public1/home/sc30797/wangzijian/scripts/draw_mapping.pl  10Kalign.bed 10Kalign.kar highlight.txt 10Kalign.coor