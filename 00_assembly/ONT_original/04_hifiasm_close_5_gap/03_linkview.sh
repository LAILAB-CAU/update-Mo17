for x in G*-*
do
cd ${x}
~/wangzijian/software/LINKVIEW-master/LINKVIEW.py -t3 ../Mo17_ont_origin_asm.fahifiasmContig_forward.paf  -k k.txt -hl ../highlight.txt  --chro_axis --no_scale --show_pos_with_label -o ${x}
cd ..
done