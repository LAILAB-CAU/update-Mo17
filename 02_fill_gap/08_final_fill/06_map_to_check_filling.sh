#!/bin/bash

source activate wzjMap

pbhifiasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/Mo17.p_ctg.sort.forward.fa
pbcanu=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/canu2/01_anchor/Mo17.contigs.sort.forward.fa
ontasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa
theread=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/05_overall_fill/read_for_close.fa
thePier=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/04_TAG/TAG_piers_seqkit.fa
rDNA_asm=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/01_rDNA/rDNA_asm.fa

samtools faidx ${thePier}    G11                                                | seqkit seq    -w 0 >> fill_region.fa  
samtools faidx ${thePier}    G12L                                               | seqkit seq    -w 0 >> fill_region.fa   
samtools faidx ${thePier}    G12R                                               | seqkit seq    -w 0 >> fill_region.fa   
samtools faidx ${thePier}    G21L                                               | seqkit seq    -w 0 >> fill_region.fa     
samtools faidx ${thePier}    G21R                                               | seqkit seq    -w 0 >> fill_region.fa      
echo -e ">ptg000059l_1_11840533" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000059l:1-11840533                              | seqkit seq -s -w 0 >> fill_region.fa     
samtools faidx ${thePier}    G23                                                | seqkit seq    -w 0 >> fill_region.fa  
echo -e ">ptg000202l_10765242_17577709" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000202l:10765242-17577709                       | seqkit seq -s -w 0 >> fill_region.fa 
echo -e ">ptg000148l_9165444_17749270" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000148l:9165444-17749270                        | seqkit seq -s -w 0 >> fill_region.fa 
samtools faidx ${thePier}    G41L                                               | seqkit seq    -w 0 >> fill_region.fa 
samtools faidx ${thePier}    G41R                                               | seqkit seq    -w 0 >> fill_region.fa   
echo -e ">ptg000004l_10975267_26629062" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000004l:10975267-26629062                       | seqkit seq -s -w 0 >> fill_region.fa
echo -e ">ptg000134l_27316891_30928642" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000134l:27316891-30928642                       | seqkit seq -s -w 0 >> fill_region.fa
samtools faidx ${theread}    3ed35be2-1188-4f47-bf9e-7d6590be0955               | seqkit seq    -w 0 >> fill_region.fa
samtools faidx ${rDNA_asm}   rDNA_asm                                           | seqkit seq    -w 0 >> fill_region.fa
echo -e ">ptg000031l_23252658_23282604" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000031l:23252658-23282604                       | seqkit seq -s -w 0 >> fill_region.fa
echo -e ">ptg000003l_54599491_55933722" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000003l:54599491-55933722                       | seqkit seq -s -w 0 >> fill_region.fa
echo -e ">ptg000047l_52764161_56609946" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000047l:52764161-56609946                       | seqkit seq -s -w 0 >> fill_region.fa
echo -e ">ptg000006l_14256978_43394161" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000006l:14256978-43394161                       | seqkit seq -s -w 0 >> fill_region.fa
echo -e ">ptg000011l_51831772_52695976" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000011l:51831772-52695976                       | seqkit seq -s -w 0 >> fill_region.fa
echo -e ">ptg000013l_39584914_47763680" >> fill_region.fa
samtools faidx ${pbhifiasm}  ptg000013l:39584914-47763680                       | seqkit seq -s -w 0 >> fill_region.fa

minimap2 -t 64 -cx asm20 -f 0.02 /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa fill_region.fa > check_fill.paf