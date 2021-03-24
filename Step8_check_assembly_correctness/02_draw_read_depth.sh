#!/bin/bash
set -u
set -e

perl drawContigDepth.pl Mo17.almostComplete.fa.1MB.bed ~/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/Mo17_almostComplete/rm_for_draw.hl Mo17.almostComplete.fa.depth.bed

source /public1/soft/modules/module.sh
module load singularity/singularity-2.6.0-yangzq
for x in *.svg
do
name="${x%.*}"
singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $x --export-pdf ${name}.pdf
done