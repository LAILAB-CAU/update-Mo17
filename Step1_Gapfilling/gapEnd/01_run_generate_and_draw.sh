#!/bin/bash
set -u 
set -e 

# perl generate_mapping_files.pl tig00005959.paf readAlignment
# perl generate_mapping_files.pl page20.paf readAlignment
# perl generate_mapping_files.pl 2_2:1-2000000.paf readAlignment
# perl generate_mapping_files.pl 2_1:195000000-197322358.paf readAlignment
# perl generate_mapping_files.pl 2_1:1-2000000.paf readAlignment
# perl generate_mapping_files.pl 1_3:1-2000000.paf readAlignment
# perl generate_mapping_files.pl 1_2:21000000-23459789.paf readAlignment
# perl generate_mapping_files.pl 1_2:1-2000000.paf readAlignment
# perl generate_mapping_files.pl 1_1:224000000-226014391.paf readAlignment
# perl generate_mapping_files.pl 0c37ee39-bdd6-4ddc-a4ce-a5a9f46a699a.paf readAlignment


# cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/find_bigSSR_genomeRegion/lass/toDraw/toDraw.hl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/find_bigSSR_genomeRegion/lass/maskTAG/repeat/extend.reads.hl > highlight.txt

perl /public1/home/sc30797/wangzijian/scripts/draw_mapping.pl readAlignment.bed readAlignment.kar highlight.txt readAlignment.coor