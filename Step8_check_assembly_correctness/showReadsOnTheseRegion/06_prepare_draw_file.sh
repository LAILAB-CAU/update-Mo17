#!/bin/bash
set -u 
set -e 


perl generate_mapping_files.pl candidate.asm.paf 2_2_12000000_13000000 2_2:12000000:13000000
perl generate_mapping_files.pl candidate.asm.paf 9_138000000_139000000 9:138000000:139000000
perl generate_mapping_files.pl candidate.asm.paf 1_3_4000000_5000000 1_3:4000000:5000000
perl generate_mapping_files.pl candidate.asm.paf 4_5500000_6500000 4:5500000:6500000
perl generate_mapping_files.pl candidate.asm.paf 2_2_30500000_31500000 2_2:30500000:31500000
perl generate_mapping_files.pl candidate.asm.paf 5_204000000_205000000 5:204000000:205000000
perl generate_mapping_files.pl candidate.asm.paf 4_107500000_108500000 4:107500000:108500000
perl generate_mapping_files.pl candidate.asm.paf 2_1_174000000_175000000 2_1:174000000:175000000
perl generate_mapping_files.pl candidate.asm.paf 4_195000000_196000000 4:195000000:196000000
perl generate_mapping_files.pl candidate.asm.paf 4_207000000_208000000 4:207000000:208000000
perl generate_mapping_files.pl candidate.asm.paf 4_42000000_43000000 4:42000000:43000000
perl generate_mapping_files.pl candidate.pac.paf tig00006427_4000000_5000000 tig00006427:4000000:5000000
perl generate_mapping_files.pl candidate.pac.paf tig00005777_51500000_52500000 tig00005777:51500000:52500000
perl generate_mapping_files.pl candidate.pac.paf ptg000148l_16100000_17100000 ptg000148l:16100000:17100000

cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/showReadsOnTheseRegion/repeat/candidate.reads.hl /public1/home/sc30797/wangzijian/update_Mo17/EDTA3/re_anno_by_repeatmasker/Mo17_almostComplete/rm_for_draw.hl > highlight.txt