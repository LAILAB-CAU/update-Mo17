#!/bin/bash
set -u 
set -e 


cat /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/showReadsOnTheseRegion/closed/repeat/candidate.reads.hl /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/Now_extension/Now_extension.hl > highlight.txt



perl generate_mapping_files.pl candidate.asm.paf 2_1_47470763_48970763	2_1:47470763:48970763
perl generate_mapping_files.pl candidate.asm.paf 2_1_48470763_49970763	2_1:48470763:49970763
perl generate_mapping_files.pl candidate.asm.paf 2_1_49470763_50970763	2_1:49470763:50970763
perl generate_mapping_files.pl candidate.asm.paf 2_1_50470763_51470763	2_1:50470763:51470763

perl generate_mapping_files.pl candidate.asm.paf 6_2_21397811_22897811	6_2:21397811:22897811
perl generate_mapping_files.pl candidate.asm.paf 6_2_22397811_23897811	6_2:22397811:23897811
perl generate_mapping_files.pl candidate.asm.paf 6_2_23397811_24897811	6_2:23397811:24897811
perl generate_mapping_files.pl candidate.asm.paf 6_2_24397811_25397811	6_2:24397811:25397811

perl generate_mapping_files.pl candidate.asm.paf 8_50891899_52391899	8:50891899:52391899
perl generate_mapping_files.pl candidate.asm.paf 8_51891899_53388920	8:51891899:53388920
perl generate_mapping_files.pl candidate.asm.paf 8_52891899_54388920	8:52891899:54388920
perl generate_mapping_files.pl candidate.asm.paf 8_53891899_55388920	8:53891899:55388920
perl generate_mapping_files.pl candidate.asm.paf 8_54891899_56388920	8:54891899:56388920
perl generate_mapping_files.pl candidate.asm.paf 8_55891899_56688920	8:55891899:56688920

perl generate_mapping_files.pl candidate.asm.paf 8_163500000_165000000	8:163500000:165000000
perl generate_mapping_files.pl candidate.asm.paf 8_164500000_166000000	8:164500000:166000000
perl generate_mapping_files.pl candidate.asm.paf 8_165500000_167000000	8:165500000:167000000
perl generate_mapping_files.pl candidate.asm.paf 8_166500000_168000000	8:166500000:168000000
perl generate_mapping_files.pl candidate.asm.paf 8_167500000_169000000	8:167500000:169000000
perl generate_mapping_files.pl candidate.asm.paf 8_168500000_170000000	8:168500000:170000000
perl generate_mapping_files.pl candidate.asm.paf 8_169500000_171000000	8:169500000:171000000
perl generate_mapping_files.pl candidate.asm.paf 8_170500000_172000000	8:170500000:172000000
perl generate_mapping_files.pl candidate.asm.paf 8_171500000_173000000	8:171500000:173000000
perl generate_mapping_files.pl candidate.asm.paf 8_172500000_174000000	8:172500000:174000000
perl generate_mapping_files.pl candidate.asm.paf 8_173500000_175000000	8:173500000:175000000
perl generate_mapping_files.pl candidate.asm.paf 8_174500000_176000000	8:174500000:176000000
perl generate_mapping_files.pl candidate.asm.paf 8_175500000_177000000	8:175500000:177000000
perl generate_mapping_files.pl candidate.asm.paf 8_176500000_178000000	8:176500000:178000000
perl generate_mapping_files.pl candidate.asm.paf 8_177500000_179000000	8:177500000:179000000
perl generate_mapping_files.pl candidate.asm.paf 8_178500000_180000000	8:178500000:180000000
perl generate_mapping_files.pl candidate.asm.paf 8_179500000_181000000	8:179500000:181000000
perl generate_mapping_files.pl candidate.asm.paf 8_180500000_182000000	8:180500000:182000000
perl generate_mapping_files.pl candidate.asm.paf 8_181500000_183000000	8:181500000:183000000
perl generate_mapping_files.pl candidate.asm.paf 8_182500000_184000000	8:182500000:184000000
perl generate_mapping_files.pl candidate.asm.paf 8_183500000_185000000	8:183500000:185000000
perl generate_mapping_files.pl candidate.asm.paf 8_184500000_186000000	8:184500000:186000000
perl generate_mapping_files.pl candidate.asm.paf 8_185500000_187000000	8:185500000:187000000
perl generate_mapping_files.pl candidate.asm.paf 8_186500000_188000000	8:186500000:188000000


perl generate_mapping_files.pl candidate.asm.paf 9_161182585_162682585	9:161182585:162682585
perl generate_mapping_files.pl candidate.asm.paf 9_162182585_163682585	9:162182585:163682585
perl generate_mapping_files.pl candidate.asm.paf 9_163182585_164682585	9:163182585:164682585
perl generate_mapping_files.pl candidate.asm.paf 9_164182585_165182585	9:164182585:165182585