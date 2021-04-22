#!/bin/bash
source activate wzjMap
ontasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa
minimap2 -t 64 -cx asm5 -f 0.02 Mo17.final.fa ${ontasm} > Mo17.final.fa.Mo17_ont_origin_asm.fa.paf
