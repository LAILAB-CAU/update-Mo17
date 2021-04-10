#!/bin/bash

source activate wzjMap

gapseq=/public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/find_bigSSR_genomeRegion/lass/toDraw.fa
pier=/public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/usePierToExtend/pier3/all_pier.fa
reads=/public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/usePierToExtend/pier3/Step1_map_410_Reads_to_all_pier/410_Reads.fa
unmapped=/public1/home/sc30797/wangzijian/update_Mo17/Step4_local_assembly/nanopore_minimap2/nanopore.unmapped.fa
samtools faidx ${pier} page20 >> pier.fa
samtools faidx ${reads} 0c37ee39-bdd6-4ddc-a4ce-a5a9f46a699a >> reads.fa
samtools faidx ${reads} 112d34c7-4446-404b-a68c-0dda5437aad7 >> reads.fa
samtools faidx ${reads} 480aeec0-8830-4832-9d6a-2f8477010438 >> reads.fa
samtools faidx ${reads} 64761358-4a30-45c5-86f7-1cca58fc765f >> reads.fa
cat ${gapseq} pier.fa reads.fa > ssrRef.fa

minimap2 -t 64 -ax map-ont -r 10000 ssrRef.fa ${unmapped} | samtools view -bS - > ssrRef.unmapped.bam
perl /public1/home/sc30797/wangzijian/scripts/map/get_the_detailed_mapping_information_from_bwa_bam_file.pl ssrRef.unmapped.bam 0  > ssrRef.unmapped.bam.infor 