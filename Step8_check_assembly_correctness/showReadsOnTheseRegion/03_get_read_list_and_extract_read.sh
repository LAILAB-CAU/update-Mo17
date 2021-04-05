#!/bin/bash
set -u 
set -e 

# for x in *.region.bed
# do
# cellname=${x%%.*}
# awk '{print $4}' ${x} >> ${cellname}.list
# done

# cd remap
# for x in *.region.bed
# do
# cellname=${x%%.*}
# awk '{print $4}' ${x} >> ../${cellname}.list
# done


sort 20200409-UNL085-P5-PAE46763.list | uniq - > 20200409-UNL085-P5-PAE46763.uniq.list && seqkit grep -f 20200409-UNL085-P5-PAE46763.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200409-UNL085-P5-PAE46763.fa >> candidate.fa
sort 20200408-UNL085-P5-PAE69418.list | uniq - > 20200408-UNL085-P5-PAE69418.uniq.list && seqkit grep -f 20200408-UNL085-P5-PAE69418.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200408-UNL085-P5-PAE69418.fa >> candidate.fa
sort 20200407-UNL085-P5-PAE66590.list | uniq - > 20200407-UNL085-P5-PAE66590.uniq.list && seqkit grep -f 20200407-UNL085-P5-PAE66590.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200407-UNL085-P5-PAE66590.fa >> candidate.fa
sort 20200406-UNL085-P5-PAE70217.list | uniq - > 20200406-UNL085-P5-PAE70217.uniq.list && seqkit grep -f 20200406-UNL085-P5-PAE70217.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200406-UNL085-P5-PAE70217.fa >> candidate.fa
sort 20200406-UNL085-P1-PAE69448.list | uniq - > 20200406-UNL085-P1-PAE69448.uniq.list && seqkit grep -f 20200406-UNL085-P1-PAE69448.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200406-UNL085-P1-PAE69448.fa >> candidate.fa
sort 20200405-UNL085-P1-PAE69448.list | uniq - > 20200405-UNL085-P1-PAE69448.uniq.list && seqkit grep -f 20200405-UNL085-P1-PAE69448.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE69448.fa >> candidate.fa
sort 20200405-UNL085-P1-PAE69208.list | uniq - > 20200405-UNL085-P1-PAE69208.uniq.list && seqkit grep -f 20200405-UNL085-P1-PAE69208.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE69208.fa >> candidate.fa
sort 20200405-UNL085-P1-PAE64851.list | uniq - > 20200405-UNL085-P1-PAE64851.uniq.list && seqkit grep -f 20200405-UNL085-P1-PAE64851.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE64851.fa >> candidate.fa
sort 20200405-UNL085-P1-PAE59610.list | uniq - > 20200405-UNL085-P1-PAE59610.uniq.list && seqkit grep -f 20200405-UNL085-P1-PAE59610.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE59610.fa >> candidate.fa
sort 20200405-UNL085-P1-PAE58455.list | uniq - > 20200405-UNL085-P1-PAE58455.uniq.list && seqkit grep -f 20200405-UNL085-P1-PAE58455.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE58455.fa >> candidate.fa
sort 20200404-UNL085-P1-PAE64841.list | uniq - > 20200404-UNL085-P1-PAE64841.uniq.list && seqkit grep -f 20200404-UNL085-P1-PAE64841.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE64841.fa >> candidate.fa
sort 20200404-UNL085-P1-PAE63133.list | uniq - > 20200404-UNL085-P1-PAE63133.uniq.list && seqkit grep -f 20200404-UNL085-P1-PAE63133.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE63133.fa >> candidate.fa
sort 20200404-UNL085-P1-PAE62586.list | uniq - > 20200404-UNL085-P1-PAE62586.uniq.list && seqkit grep -f 20200404-UNL085-P1-PAE62586.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE62586.fa >> candidate.fa
sort 20200404-UNL085-P1-PAE59636.list | uniq - > 20200404-UNL085-P1-PAE59636.uniq.list && seqkit grep -f 20200404-UNL085-P1-PAE59636.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE59636.fa >> candidate.fa
sort 20200404-UNL085-P1-PAE58899.list | uniq - > 20200404-UNL085-P1-PAE58899.uniq.list && seqkit grep -f 20200404-UNL085-P1-PAE58899.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE58899.fa >> candidate.fa
sort 20200403-UNL085-P1-PAE65508.list | uniq - > 20200403-UNL085-P1-PAE65508.uniq.list && seqkit grep -f 20200403-UNL085-P1-PAE65508.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200403-UNL085-P1-PAE65508.fa >> candidate.fa
sort 20200403-UNL085-P1-PAE63133.list | uniq - > 20200403-UNL085-P1-PAE63133.uniq.list && seqkit grep -f 20200403-UNL085-P1-PAE63133.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200403-UNL085-P1-PAE63133.fa >> candidate.fa
sort 20200403-UNL085-P1-PAE59748.list | uniq - > 20200403-UNL085-P1-PAE59748.uniq.list && seqkit grep -f 20200403-UNL085-P1-PAE59748.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200403-UNL085-P1-PAE59748.fa >> candidate.fa
sort 20200402-UNL085-P1-PAE66442.list | uniq - > 20200402-UNL085-P1-PAE66442.uniq.list && seqkit grep -f 20200402-UNL085-P1-PAE66442.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200402-UNL085-P1-PAE66442.fa >> candidate.fa
sort 20200331-UNL085-P1-PAE77443.list | uniq - > 20200331-UNL085-P1-PAE77443.uniq.list && seqkit grep -f 20200331-UNL085-P1-PAE77443.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE77443.fa >> candidate.fa
sort 20200331-UNL085-P1-PAE76304.list | uniq - > 20200331-UNL085-P1-PAE76304.uniq.list && seqkit grep -f 20200331-UNL085-P1-PAE76304.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE76304.fa >> candidate.fa
sort 20200331-UNL085-P1-PAE76301.list | uniq - > 20200331-UNL085-P1-PAE76301.uniq.list && seqkit grep -f 20200331-UNL085-P1-PAE76301.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE76301.fa >> candidate.fa
sort 20200331-UNL085-P1-PAE73476.list | uniq - > 20200331-UNL085-P1-PAE73476.uniq.list && seqkit grep -f 20200331-UNL085-P1-PAE73476.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE73476.fa >> candidate.fa
sort 20200330-UNL085-P1-PAE74959.list | uniq - > 20200330-UNL085-P1-PAE74959.uniq.list && seqkit grep -f 20200330-UNL085-P1-PAE74959.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200330-UNL085-P1-PAE74959.fa >> candidate.fa
sort 20200330-UNL085-P1-PAE73001.list | uniq - > 20200330-UNL085-P1-PAE73001.uniq.list && seqkit grep -f 20200330-UNL085-P1-PAE73001.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200330-UNL085-P1-PAE73001.fa >> candidate.fa
sort 20200330-UNL085-P1-PAE72324.list | uniq - > 20200330-UNL085-P1-PAE72324.uniq.list && seqkit grep -f 20200330-UNL085-P1-PAE72324.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200330-UNL085-P1-PAE72324.fa >> candidate.fa
sort 20200329-UNL085-P1-PAE78052.list | uniq - > 20200329-UNL085-P1-PAE78052.uniq.list && seqkit grep -f 20200329-UNL085-P1-PAE78052.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200329-UNL085-P1-PAE78052.fa >> candidate.fa
sort 20200328-UNL085-P1-PAE78052.list | uniq - > 20200328-UNL085-P1-PAE78052.uniq.list && seqkit grep -f 20200328-UNL085-P1-PAE78052.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200328-UNL085-P1-PAE78052.fa >> candidate.fa
sort 20200313-UNL085-P1-PAE30600.list | uniq - > 20200313-UNL085-P1-PAE30600.uniq.list && seqkit grep -f 20200313-UNL085-P1-PAE30600.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200313-UNL085-P1-PAE30600.fa >> candidate.fa
sort 20200312-UNL085-P1-PAE30600.list | uniq - > 20200312-UNL085-P1-PAE30600.uniq.list && seqkit grep -f 20200312-UNL085-P1-PAE30600.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200312-UNL085-P1-PAE30600.fa >> candidate.fa
sort 20200118-UNL085-P5-PAE39466.list | uniq - > 20200118-UNL085-P5-PAE39466.uniq.list && seqkit grep -f 20200118-UNL085-P5-PAE39466.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200118-UNL085-P5-PAE39466.fa >> candidate.fa
sort 20200117-UNL085-P5-PAE39466.list | uniq - > 20200117-UNL085-P5-PAE39466.uniq.list && seqkit grep -f 20200117-UNL085-P5-PAE39466.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200117-UNL085-P5-PAE39466.fa >> candidate.fa
sort 20191230-UNL085-P1-PAE32963.list | uniq - > 20191230-UNL085-P1-PAE32963.uniq.list && seqkit grep -f 20191230-UNL085-P1-PAE32963.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191230-UNL085-P1-PAE32963.fa >> candidate.fa
sort 20191219-UNL085-P5-PAE34153.list | uniq - > 20191219-UNL085-P5-PAE34153.uniq.list && seqkit grep -f 20191219-UNL085-P5-PAE34153.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191219-UNL085-P5-PAE34153.fa >> candidate.fa
sort 20200405-UNL085-P1-PAE55943.list | uniq - > 20200405-UNL085-P1-PAE55943.uniq.list && seqkit grep -f 20200405-UNL085-P1-PAE55943.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE55943.fa >> candidate.fa
sort 20191231-UNL085-P1-PAE32963.list | uniq - > 20191231-UNL085-P1-PAE32963.uniq.list && seqkit grep -f 20191231-UNL085-P1-PAE32963.uniq.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191231-UNL085-P1-PAE32963.fa >> candidate.fa
