#!/bin/bash
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 1_1:224000000-226014391+1700000+2014392
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 1_2:1-2000000+0+150000
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 1_2:21000000-23459789+2350000+2459790
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 1_3:1-2000000+0+500000
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len tig00005959+750000+856336
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 2_1:1-2000000+0+200000
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 2_1:195000000-197322358+2200000+2322359
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 2_2:1-2000000+0+1400000
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len page20+200000+1411347
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 0c37ee39-bdd6-4ddc-a4ce-a5a9f46a699a+0+179235
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 112d34c7-4446-404b-a68c-0dda5437aad7+0+512802
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 480aeec0-8830-4832-9d6a-2f8477010438+0+175745
perl generate_mapping_files.pl ssrRef.unmapped.bam.infor mapped.read.len 64761358-4a30-45c5-86f7-1cca58fc765f+0+197730

sort mapped.read.len | uniq - > mapped.read.len.uniq
