#!/bin/bash

source activate wzjMap

ontasm=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.unpolished.fa
polish=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/genome.nextpolish.fasta.gz

minimap2 -t64 -cx asm20 -f 0.02 ${ontasm} ${polish} > polish_remap.paf