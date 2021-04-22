#!/bin/bash

source activate wzjMap
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/04_TAG/TAG_piers.fa > /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/04_TAG/TAG_piers_seqkit.fa
pbhifiasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/Mo17.p_ctg.sort.forward.fa
pbcanu=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/canu2/01_anchor/Mo17.contigs.sort.forward.fa
ontasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa
theread=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/05_overall_fill/read_for_close.fa
thePier=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/04_TAG/TAG_piers_seqkit.fa
rDNA_asm=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/01_rDNA/rDNA_asm.fa
the5S=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/05_overall_fill/fill_5SrRNA.fa

# chr1
echo -e ">chr1_1" > chr1.fa
samtools faidx ${theread}    33066c41-804b-44a9-bfcd-d1e4be3d5225:142074-209740 | seqkit seq -r -p -s -w 0 >> chr1.fa
samtools faidx ${ontasm}     Contig1:65419-225508384                            | seqkit seq       -s -w 0 >> chr1.fa
samtools faidx ${thePier}    G11:29-891654                                      | seqkit seq       -s -w 0 >> chr1.fa            
samtools faidx ${ontasm}     Contig2:444555-22979130                            | seqkit seq       -s -w 0 >> chr1.fa              
samtools faidx ${thePier}    G12L:38-489296                                     | seqkit seq       -s -w 0 >> chr1.fa
echo -e ">chr1_2" >> chr1.fa
samtools faidx ${thePier}    G12R:1-472660                                      | seqkit seq       -s -w 0 >> chr1.fa
samtools faidx ${ontasm}     Contig3:1-57315199                                 | seqkit seq       -s -w 0 >> chr1.fa
samtools faidx ${theread}    10cc329c-67e5-43d6-8227-8a8eef0147b3:77461-112463  | seqkit seq       -s -w 0 >> chr1.fa

# chr2
echo -e ">chr2_1" > chr2.fa
samtools faidx ${theread}    7955e4cd-5cc8-4d2f-b559-ce700a3deac6:177165-177397 | seqkit seq -r -p -s -w 0 >> chr2.fa                                
samtools faidx ${pbcanu}     tig00005959:24982-794126                           | seqkit seq -r -p -s -w 0 >> chr2.fa
samtools faidx ${thePier}    G21L:148348-272365                                 | seqkit seq       -s -w 0 >> chr2.fa
echo -e ">chr2_2" >> chr2.fa
samtools faidx ${thePier}    G21R:1-218684                                      | seqkit seq       -s -w 0 >> chr2.fa      
samtools faidx ${ontasm}     Contig5:78828-44305322                             | seqkit seq       -s -w 0 >> chr2.fa    
samtools faidx ${pbhifiasm}  ptg000059l:1-11840533                              | seqkit seq       -s -w 0 >> chr2.fa
samtools faidx ${ontasm}     Contig6:6863204-147687274                          | seqkit seq       -s -w 0 >> chr2.fa
samtools faidx ${thePier}    G23:15-1901722                                     | seqkit seq       -s -w 0 >> chr2.fa     
samtools faidx ${ontasm}     Contig7:491068-10737473                            | seqkit seq       -s -w 0 >> chr2.fa      
samtools faidx ${pbhifiasm}  ptg000202l:10765242-17577709                       | seqkit seq       -s -w 0 >> chr2.fa     
samtools faidx ${ontasm}     Contig7:17550737-26716580                          | seqkit seq       -s -w 0 >> chr2.fa  
samtools faidx ${pbhifiasm}  ptg000148l:9165444-13716140                        | seqkit seq       -s -w 0 >> chr2.fa
samtools faidx ${the5S}      the542_5SrRNA                                      | seqkit seq       -s -w 0 >> chr2.fa
samtools faidx ${pbhifiasm}  ptg000148l:13716141-17749270                       | seqkit seq       -s -w 0 >> chr2.fa
samtools faidx ${ontasm}     Contig7:35075229-47663136                          | seqkit seq       -s -w 0 >> chr2.fa  
samtools faidx ${theread}    e6e38808-4ef1-4d05-8125-94f969a000a6:29-186663     | seqkit seq       -s -w 0 >> chr2.fa                       

# chr3
echo -e ">chr3" > chr3.fa
samtools faidx ${theread}    fd901b24-3984-4240-b23d-d1ece0308790:71485-71500   | seqkit seq -r -p -s -w 0 >> chr3.fa
samtools faidx ${ontasm}     Contig8:22643-242776723                            | seqkit seq       -s -w 0 >> chr3.fa   
samtools faidx ${theread}    a1aa57af-0fff-49a5-9753-ba1085e2b298:1-77443       | seqkit seq       -s -w 0 >> chr3.fa                        

# chr4
echo -e ">chr4_1" > chr4.fa
samtools faidx ${theread}    5e5e7e17-6221-496b-8257-14fb726da7ba:142445-142460 | seqkit seq -r -p -s -w 0 >> chr4.fa
samtools faidx ${ontasm}     Contig9:2599-16765204                              | seqkit seq       -s -w 0 >> chr4.fa                                                      
samtools faidx ${thePier}    G41L:27-1296135                                    | seqkit seq       -s -w 0 >> chr4.fa                                                
echo -e ">chr4_2" >> chr4.fa
samtools faidx ${thePier}    G41R:1-179130                                      | seqkit seq       -s -w 0 >> chr4.fa                                              
samtools faidx ${ontasm}     Contig9:17305249-33114148                          | seqkit seq       -s -w 0 >> chr4.fa                                                          
samtools faidx ${pbhifiasm}  ptg000004l:10975267-26629062                       | seqkit seq       -s -w 0 >> chr4.fa                                                             
samtools faidx ${ontasm}     Contig9:48750977-194093731                         | seqkit seq       -s -w 0 >> chr4.fa                                                           
samtools faidx ${pbhifiasm}  ptg000134l:27316891-30928642                       | seqkit seq       -s -w 0 >> chr4.fa                                                             
samtools faidx ${ontasm}     Contig9:197712619-250264303                        | seqkit seq       -s -w 0 >> chr4.fa                                                            
samtools faidx ${theread}    fa2744b0-0118-4bb9-ad7d-ff58ab60eb92:208072-236897 | seqkit seq       -s -w 0 >> chr4.fa                                                                                   

# chr5
echo -e ">chr5" > chr5.fa
samtools faidx ${theread}    cb1be39b-aff9-4e95-883d-cc4d9a1aa66a:147899-193197 | seqkit seq -r -p -s -w 0 >> chr5.fa
samtools faidx ${ontasm}     Contig10:61493-204554320                           | seqkit seq       -s -w 0 >> chr5.fa      
samtools faidx ${theread}    3ed35be2-1188-4f47-bf9e-7d6590be0955:151103-181328 | seqkit seq -r -p -s -w 0 >> chr5.fa
samtools faidx ${ontasm}     Contig10:204588226-220301113                       | seqkit seq       -s -w 0 >> chr5.fa       
samtools faidx ${theread}    dd7550e5-85b5-418c-8d74-ec6f379b48a7:138414-138431 | seqkit seq       -s -w 0 >> chr5.fa

# chr6
echo -e ">chr6" > chr6.fa
samtools faidx ${theread}    5b22b979-b615-403a-ac37-3b5bf888a925:56030-56046   | seqkit seq -r -p -s -w 0 >> chr6.fa
samtools faidx ${ontasm}     Contig11:621-17830144                              | seqkit seq       -s -w 0 >> chr6.fa        
samtools faidx ${rDNA_asm}   rDNA_asm:1-24136907                                | seqkit seq       -s -w 0 >> chr6.fa      
samtools faidx ${ontasm}     Contig12:1531931-23272224                          | seqkit seq       -s -w 0 >> chr6.fa            
samtools faidx ${pbhifiasm}  ptg000031l:23252658-23282604                       | seqkit seq       -s -w 0 >> chr6.fa               
samtools faidx ${ontasm}     Contig13:242511-135251146                          | seqkit seq       -s -w 0 >> chr6.fa            
samtools faidx ${theread}    e81315b6-1542-4aca-9dfe-8dc05514b0e3:57657-90101   | seqkit seq       -s -w 0 >> chr6.fa    

# chr7
echo -e ">chr7" > chr7.fa
samtools faidx ${theread}    2fc4e334-d309-4c0e-b399-65d1fb86bbd7:78379-98677   | seqkit seq -r -p -s -w 0 >> chr7.fa
samtools faidx ${ontasm}     Contig14:20996-54605975                            | seqkit seq       -s -w 0 >> chr7.fa   
samtools faidx ${pbhifiasm}  ptg000003l:54599491-55933722                       | seqkit seq       -s -w 0 >> chr7.fa        
samtools faidx ${ontasm}     Contig14:55879838-181202963                        | seqkit seq       -s -w 0 >> chr7.fa       
samtools faidx ${theread}    ceec77f2-9190-4381-82b4-163ae5a4c0dc:66896-70564   | seqkit seq       -s -w 0 >> chr7.fa                           

# chr8
echo -e ">chr8" > chr8.fa
samtools faidx ${theread}    de3f5066-f04c-4fc1-bcbe-90ce2bf6024f:224844-261813 | seqkit seq -r -p -s -w 0 >> chr8.fa
samtools faidx ${ontasm}     Contig15:24478-52774491                            | seqkit seq       -s -w 0 >> chr8.fa  
samtools faidx ${pbhifiasm}  ptg000047l:52764161-56609946                       | seqkit seq       -s -w 0 >> chr8.fa       
samtools faidx ${ontasm}     Contig16:2016344-110804306                         | seqkit seq       -s -w 0 >> chr8.fa     
samtools faidx ${pbhifiasm}  ptg000006l:14256978-43394161                       | seqkit seq       -s -w 0 >> chr8.fa       
samtools faidx ${ontasm}     Contig17:13701186-27684393                         | seqkit seq       -s -w 0 >> chr8.fa     
samtools faidx ${theread}    3f94e2ef-3def-4d3b-bab4-2938c4d655dc:187240-207360 | seqkit seq       -s -w 0 >> chr8.fa                             

# chr9
echo -e ">chr9" > chr9.fa
samtools faidx ${theread}    8ca45221-bf0b-4b52-9354-63ca22cb4e7c:109703-136518 | seqkit seq -r -p -s -w 0 >> chr9.fa
samtools faidx ${ontasm}     Contig18:22364-60388420                            | seqkit seq       -s -w 0 >> chr9.fa    
samtools faidx ${pbhifiasm}  ptg000011l:51831772-52695976                       | seqkit seq       -s -w 0 >> chr9.fa         
samtools faidx ${ontasm}     Contig18:61256671-159112532                        | seqkit seq       -s -w 0 >> chr9.fa        
samtools faidx ${pbhifiasm}  ptg000013l:39584914-47763680                       | seqkit seq       -s -w 0 >> chr9.fa         
samtools faidx ${ontasm}     Contig19:4431911-5284939                           | seqkit seq       -s -w 0 >> chr9.fa     
samtools faidx ${theread}    e1708ea7-e46a-492b-b6c6-4993618c3188:159192-171344 | seqkit seq       -s -w 0 >> chr9.fa                               

# chr10
echo -e ">chr10" > chr10.fa
samtools faidx ${theread}    ee817fcf-f3af-4ffa-903f-c0ea203a4afc:86689-109155  | seqkit seq -r -p -s -w 0 >> chr10.fa
samtools faidx ${ontasm}     Contig20:35703-149823240                           | seqkit seq       -s -w 0 >> chr10.fa   
samtools faidx ${theread}    48aa457d-32e9-4ad4-83b2-4e6109267ef4:159933-176547 | seqkit seq       -s -w 0 >> chr10.fa                             

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
| seqkit seq - > Mo17.final.fa
seqkit fx2tab -nl Mo17.final.fa > Mo17.final.fa.len 
seqkit stat -a Mo17.final.fa > Mo17.final.fa.stat