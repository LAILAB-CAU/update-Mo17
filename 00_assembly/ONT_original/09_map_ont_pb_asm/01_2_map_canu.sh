#!/bin/bash

source activate wzjMap
ontasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa
pbasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/canu2/01_anchor/Mo17.contigs.sort.forward.fa

minimap2 -t64 -cx asm20 -f 0.02 ${ontasm} ${pbasm} > Mo17_ont_origin_asm.fa.Mo17.contigs.fa.paf