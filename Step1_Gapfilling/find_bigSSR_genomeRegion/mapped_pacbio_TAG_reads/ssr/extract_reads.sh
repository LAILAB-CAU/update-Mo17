#!/bin/bash
cat  \
10_0_50000_batch1_1.list \
10_19740000_19770000_batch1_1.list \
1_3_4668573_4712485_batch1_1.list \
1_3_56800000_56848833_batch1_1.list \
2_2_12314714_12454625_batch1_1.list \
4_16913083_17229947_batch1_1.list \
4_5950207_5988451_batch1_1.list \
5_0_40000_batch1_1.list \
5_134710000_134730000_batch1_1.list \
5_204554321_204587157_batch1_1.list \
6_2_156300000_156323801_batch1_1.list \
8_0_40000_batch1_1.list \
9_168160000_168175584_batch1_1.list | sort | uniq - > batch1_1.list
cat  \
10_0_50000_batch2_1.list \
10_19740000_19770000_batch2_1.list \
1_3_4668573_4712485_batch2_1.list \
1_3_56800000_56848833_batch2_1.list \
2_2_12314714_12454625_batch2_1.list \
4_16913083_17229947_batch2_1.list \
4_5950207_5988451_batch2_1.list \
5_0_40000_batch2_1.list \
5_134710000_134730000_batch2_1.list \
5_204554321_204587157_batch2_1.list \
6_2_156300000_156323801_batch2_1.list \
8_0_40000_batch2_1.list \
9_168160000_168175584_batch2_1.list | sort | uniq - > batch2_1.list
cat  \
10_0_50000_batch2_2.list \
10_19740000_19770000_batch2_2.list \
1_3_4668573_4712485_batch2_2.list \
1_3_56800000_56848833_batch2_2.list \
2_2_12314714_12454625_batch2_2.list \
4_16913083_17229947_batch2_2.list \
4_5950207_5988451_batch2_2.list \
5_0_40000_batch2_2.list \
5_134710000_134730000_batch2_2.list \
5_204554321_204587157_batch2_2.list \
6_2_156300000_156323801_batch2_2.list \
8_0_40000_batch2_2.list \
9_168160000_168175584_batch2_2.list | sort | uniq - > batch2_2.list
cat  \
10_0_50000_batch3_1.list \
10_19740000_19770000_batch3_1.list \
1_3_4668573_4712485_batch3_1.list \
1_3_56800000_56848833_batch3_1.list \
2_2_12314714_12454625_batch3_1.list \
4_16913083_17229947_batch3_1.list \
4_5950207_5988451_batch3_1.list \
5_0_40000_batch3_1.list \
5_134710000_134730000_batch3_1.list \
5_204554321_204587157_batch3_1.list \
6_2_156300000_156323801_batch3_1.list \
8_0_40000_batch3_1.list \
9_168160000_168175584_batch3_1.list | sort | uniq - > batch3_1.list
cat  \
10_0_50000_batch3_2.list \
10_19740000_19770000_batch3_2.list \
1_3_4668573_4712485_batch3_2.list \
1_3_56800000_56848833_batch3_2.list \
2_2_12314714_12454625_batch3_2.list \
4_16913083_17229947_batch3_2.list \
4_5950207_5988451_batch3_2.list \
5_0_40000_batch3_2.list \
5_134710000_134730000_batch3_2.list \
5_204554321_204587157_batch3_2.list \
6_2_156300000_156323801_batch3_2.list \
8_0_40000_batch3_2.list \
9_168160000_168175584_batch3_2.list | sort | uniq - > batch3_2.list
cat  \
10_0_50000_batch3_3.list \
10_19740000_19770000_batch3_3.list \
1_3_4668573_4712485_batch3_3.list \
1_3_56800000_56848833_batch3_3.list \
2_2_12314714_12454625_batch3_3.list \
4_16913083_17229947_batch3_3.list \
4_5950207_5988451_batch3_3.list \
5_0_40000_batch3_3.list \
5_134710000_134730000_batch3_3.list \
5_204554321_204587157_batch3_3.list \
6_2_156300000_156323801_batch3_3.list \
8_0_40000_batch3_3.list \
9_168160000_168175584_batch3_3.list | sort | uniq - > batch3_3.list
cat  \
10_0_50000_batch3_4.list \
10_19740000_19770000_batch3_4.list \
1_3_4668573_4712485_batch3_4.list \
1_3_56800000_56848833_batch3_4.list \
2_2_12314714_12454625_batch3_4.list \
4_16913083_17229947_batch3_4.list \
4_5950207_5988451_batch3_4.list \
5_0_40000_batch3_4.list \
5_134710000_134730000_batch3_4.list \
5_204554321_204587157_batch3_4.list \
6_2_156300000_156323801_batch3_4.list \
8_0_40000_batch3_4.list \
9_168160000_168175584_batch3_4.list | sort | uniq - > batch3_4.list


seqkit grep -f batch2_1.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/batch2_1.fastq.gz  | seqkit fq2fa - > batch2_1.fa &
seqkit grep -f batch3_4.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/batch3_4.fastq.gz  | seqkit fq2fa - > batch3_4.fa &
seqkit grep -f batch3_2.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/batch3_2.fastq.gz  | seqkit fq2fa - > batch3_2.fa &
seqkit grep -f batch3_3.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/batch3_3.fastq.gz  | seqkit fq2fa - > batch3_3.fa &
seqkit grep -f batch3_1.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/batch3_1.fastq.gz  | seqkit fq2fa - > batch3_1.fa &
seqkit grep -f batch1_1.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/batch1_1.fastq.gz  | seqkit fq2fa - > batch1_1.fa &
seqkit grep -f batch2_2.list /public1/home/sc30797/xie/mo17/results/haslr_assembly_pacbio/hifi_reads/hifi_fastq/batch2_2.fastq.gz  | seqkit fq2fa - > batch2_2.fa &
wait
cat batch2_1.fa \
        batch3_4.fa \
        batch3_2.fa \
        batch3_3.fa \
        batch3_1.fa \
        batch1_1.fa \
        batch2_2.fa \
        > pacbio.fa

