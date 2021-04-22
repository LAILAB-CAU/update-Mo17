#!/bin/bash
# perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/pacbio/pacbio.fa.rm.bed Mo17.p_ctg.sort.forward.fa.for_draw.bed Mo17.p_ctg.sort.forward.fa.for_draw.hl
# cat ../changed_name_Mo17_ont_origin_asm.for_draw.hl Mo17.p_ctg.sort.forward.fa.for_draw.hl > ont_hifiasm.hl
for x in x*
do
~/wangzijian/software/LINKVIEW-master/LINKVIEW.py -t3 Mo17_ont_origin_asm.fahifiasmContig_forward.paf  -k ${x} -hl ont_hifiasm.hl  --chro_axis --no_scale --show_pos_with_label -o ${x}
done