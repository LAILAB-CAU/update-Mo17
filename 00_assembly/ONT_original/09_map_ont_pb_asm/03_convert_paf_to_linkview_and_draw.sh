#!/bin/bash
# split -l 2 -d -a 2 k 
perl ~/wangzijian/scripts/read_extend_contig/change_pos_in_reverse.pl Mo17_ont_origin_asm.fa.Mo17.contigs.fa.paf Mo17_ont_origin_asm.fa.Mo17.contigs.fa.paf.linkview
perl ~/wangzijian/scripts/read_extend_contig/change_pos_in_reverse.pl Mo17_ont_origin_asm.fa.Mo17.p_ctg.fa.paf Mo17_ont_origin_asm.fa.Mo17.p_ctg.fa.paf.linkview
cat Mo17_ont_origin_asm.fa.Mo17.contigs.fa.paf.linkview Mo17_ont_origin_asm.fa.Mo17.p_ctg.fa.paf.linkview > two_pbasm_to_ontasm.paf.linkview
for x in x*
do
~/wangzijian/software/LINKVIEW-master/LINKVIEW.py -t3 two_pbasm_to_ontasm.paf.linkview  -k ${x} -hl three_asm.hl  --chro_axis --no_scale --show_pos_with_label -o ${x}
done