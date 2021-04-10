#!/bin/bash

perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 1_1:224000000-226014391+1700000+2014392  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 1_2:1-2000000+0+150000  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 1_2:21000000-23459789+2350000+2459790  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 1_3:1-2000000+0+500000  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign tig00005959+750000+856336  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 2_1:1-2000000+0+200000  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 2_1:195000000-197322358+2200000+2322359  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 2_2:1-2000000+0+1400000  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign page20+200000+1411347  30000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 30Kalign 0c37ee39-bdd6-4ddc-a4ce-a5a9f46a699a+0+179235  30000

sort 30Kalign.kar | uniq - > 30Kalign.kar.uniq
sort 30Kalign.bed | uniq - > 30Kalign.bed.uniq
rm 30Kalign.kar
rm 30Kalign.bed
mv 30Kalign.kar.uniq 30Kalign.kar
mv 30Kalign.bed.uniq 30Kalign.bed



perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 1_1:224000000-226014391+1700000+2014392 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 1_2:1-2000000+0+150000 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 1_2:21000000-23459789+2350000+2459790 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 1_3:1-2000000+0+500000 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign tig00005959+750000+856336 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 2_1:1-2000000+0+200000 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 2_1:195000000-197322358+2200000+2322359 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 2_2:1-2000000+0+1400000 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign page20+200000+1411347 10000
perl prepare_for_draw_mapping.pl ssrRef.unmapped.bam.infor 10Kalign 0c37ee39-bdd6-4ddc-a4ce-a5a9f46a699a+0+179235 10000

sort 10Kalign.kar | uniq - > 10Kalign.kar.uniq
sort 10Kalign.bed | uniq - > 10Kalign.bed.uniq
rm 10Kalign.kar
rm 10Kalign.bed
mv 10Kalign.kar.uniq 10Kalign.kar
mv 10Kalign.bed.uniq 10Kalign.bed