#!/bin/bash
set -e
set -u

for x in ./k*.txt
do
~/wangzijian/software/LINKVIEW-master/LINKVIEW.py -t3 /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/03_hifiasm_contigs_to_replace/ontContig_hifiasmContig_forward.paf -k ${x} -hl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/03_hifiasm_contigs_to_replace/highlight.txt --chro_axis --no_scale --show_pos_with_label -o ${x}
done