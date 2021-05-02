#!/bin/bash

source activate wzjMap
hifiasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/Mo17.p_ctg.sort.forward.fa
canuasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/canu2/01_anchor/Mo17.contigs.sort.forward.fa
minimap2 -t64 -cx asm20 -f 0.02 ${hifiasm} ${canuasm} > Mo17.p_ctg.sort.forward.fa.Mo17.contigs.sort.forward.fa.paf