#!/bin/bash

ontasm=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.unpolished.fa
polish=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/genome.nextpolish.fa
source activate wzjMap
echo -e ">chr1" > chr1.fa
samtools faidx ${ontasm} chr1:1-225010633                                 | seqkit seq       -s -w 0 >> chr1.fa        
samtools faidx ${polish} chr1_1:225010633-226902259_np12121212:1-1921002  | seqkit seq       -s -w 0 >> chr1.fa                                     
samtools faidx ${ontasm} chr1:226902260-307229054                         | seqkit seq       -s -w 0 >> chr1.fa                           
echo -e ">chr2" >> chr2.fa
samtools faidx ${ontasm} chr2:1-197446494                                 | seqkit seq       -s -w 0 >> chr2.fa             
samtools faidx ${polish} chr2_2:196609783-199511491_np12121212:1-2981463  | seqkit seq       -s -w 0 >> chr2.fa                                     
samtools faidx ${ontasm} chr2:200348203-247431290                         | seqkit seq       -s -w 0 >> chr2.fa                             
echo -e ">chr5" > chr5.fa
samtools faidx ${ontasm} chr5:1-204059866                                 | seqkit seq       -s -w 0 >> chr5.fa      
samtools faidx ${polish} chr5:204038127-205068353_np12121212:1-1030230    | seqkit seq       -s -w 0 >> chr5.fa                                   
samtools faidx ${ontasm} chr5:205090093-220302998                         | seqkit seq       -s -w 0 >> chr5.fa              
echo -e ">chr6" > chr6.fa
samtools faidx ${ontasm} chr6:1-17329566                                  | seqkit seq       -s -w 0 >> chr6.fa     
samtools faidx ${polish} chr6:17329541-42466448_np12121212:1-25411910     | seqkit seq       -s -w 0 >> chr6.fa                                  
samtools faidx ${ontasm} chr6:42466449-198777770                          | seqkit seq       -s -w 0 >> chr6.fa             

samtools faidx ${ontasm} chr4 >> chr4.fa
samtools faidx ${ontasm} chr3 >> chr3.fa
samtools faidx ${ontasm} chr7 >> chr7.fa
samtools faidx ${ontasm} chr8 >> chr8.fa
samtools faidx ${ontasm} chr9 >> chr9.fa
samtools faidx ${ontasm} chr10 >> chr10.fa

cat  \
chr1.fa \
chr2.fa \
chr3.fa \
chr4.fa \
chr5.fa \
chr6.fa \
chr7.fa \
chr8.fa \
chr9.fa \
chr10.fa \
| seqkit seq - > Mo17.final.polish.fa

seqkit fx2tab -nl Mo17.final.polish.fa > Mo17.final.polish.fa.len 
seqkit stat -a Mo17.final.polish.fa > Mo17.final.polish.fa.stat

rm \
chr1.fa \
chr2.fa \
chr3.fa \
chr4.fa \
chr5.fa \
chr6.fa \
chr7.fa \
chr8.fa \
chr9.fa \
chr10.fa


# chr1_1:225010633-226902259_np12121212   1921002 0       516452  +       chr1    307229054       225010633       225526918
# chr1_1:225010633-226902259_np12121212   1921002 1420840 1921002 +       chr1    307229054       226402107       226902259

# chr2_2:196609783-199511491_np12121212   2981463 0       510801  +       chr2    247431290       197446494       197957081
# chr2_2:196609783-199511491_np12121212   2981463 2466554 2981463 +       chr2    247431290       199833557       200348202

# chr5:204038127-205068353_np12121212     1030230 0       504673  +       chr5    220302998       204059866       204564741
# chr5:204038127-205068353_np12121212     1030230 523153  1030230 +       chr5    220302998       204583012       205090092

# chr6:17329541-42466448_np12121212       25411910        0       505319  +       chr6    198777770       17329566        17834778
# chr6:17329541-42466448_np12121212       25411910        24006549        25411910        +       chr6    198777770       41075635        42466448

