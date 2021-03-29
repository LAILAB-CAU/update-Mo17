#!/bin/bash
python end_extend.py 20191219-UNL085-P5-PAE34153.paf | awk '{print $1}' - | sort | uniq - > 20191219-UNL085-P5-PAE34153.list && seqkit grep -f 20191219-UNL085-P5-PAE34153.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191219-UNL085-P5-PAE34153.fa >> extend.fa
python end_extend.py 20191230-UNL085-P1-PAE32963.paf | awk '{print $1}' - | sort | uniq - > 20191230-UNL085-P1-PAE32963.list && seqkit grep -f 20191230-UNL085-P1-PAE32963.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191230-UNL085-P1-PAE32963.fa >> extend.fa
python end_extend.py 20191231-UNL085-P1-PAE32963.paf | awk '{print $1}' - | sort | uniq - > 20191231-UNL085-P1-PAE32963.list && seqkit grep -f 20191231-UNL085-P1-PAE32963.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191231-UNL085-P1-PAE32963.fa >> extend.fa
python end_extend.py 20200117-UNL085-P5-PAE39466.paf | awk '{print $1}' - | sort | uniq - > 20200117-UNL085-P5-PAE39466.list && seqkit grep -f 20200117-UNL085-P5-PAE39466.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200117-UNL085-P5-PAE39466.fa >> extend.fa
python end_extend.py 20200118-UNL085-P5-PAE39466.paf | awk '{print $1}' - | sort | uniq - > 20200118-UNL085-P5-PAE39466.list && seqkit grep -f 20200118-UNL085-P5-PAE39466.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200118-UNL085-P5-PAE39466.fa >> extend.fa
python end_extend.py 20200312-UNL085-P1-PAE30600.paf | awk '{print $1}' - | sort | uniq - > 20200312-UNL085-P1-PAE30600.list && seqkit grep -f 20200312-UNL085-P1-PAE30600.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200312-UNL085-P1-PAE30600.fa >> extend.fa
python end_extend.py 20200313-UNL085-P1-PAE30600.paf | awk '{print $1}' - | sort | uniq - > 20200313-UNL085-P1-PAE30600.list && seqkit grep -f 20200313-UNL085-P1-PAE30600.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200313-UNL085-P1-PAE30600.fa >> extend.fa
python end_extend.py 20200328-UNL085-P1-PAE78052.paf | awk '{print $1}' - | sort | uniq - > 20200328-UNL085-P1-PAE78052.list && seqkit grep -f 20200328-UNL085-P1-PAE78052.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200328-UNL085-P1-PAE78052.fa >> extend.fa
python end_extend.py 20200329-UNL085-P1-PAE78052.paf | awk '{print $1}' - | sort | uniq - > 20200329-UNL085-P1-PAE78052.list && seqkit grep -f 20200329-UNL085-P1-PAE78052.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200329-UNL085-P1-PAE78052.fa >> extend.fa
python end_extend.py 20200330-UNL085-P1-PAE72324.paf | awk '{print $1}' - | sort | uniq - > 20200330-UNL085-P1-PAE72324.list && seqkit grep -f 20200330-UNL085-P1-PAE72324.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200330-UNL085-P1-PAE72324.fa >> extend.fa
python end_extend.py 20200330-UNL085-P1-PAE73001.paf | awk '{print $1}' - | sort | uniq - > 20200330-UNL085-P1-PAE73001.list && seqkit grep -f 20200330-UNL085-P1-PAE73001.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200330-UNL085-P1-PAE73001.fa >> extend.fa
python end_extend.py 20200330-UNL085-P1-PAE74959.paf | awk '{print $1}' - | sort | uniq - > 20200330-UNL085-P1-PAE74959.list && seqkit grep -f 20200330-UNL085-P1-PAE74959.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200330-UNL085-P1-PAE74959.fa >> extend.fa
python end_extend.py 20200331-UNL085-P1-PAE73476.paf | awk '{print $1}' - | sort | uniq - > 20200331-UNL085-P1-PAE73476.list && seqkit grep -f 20200331-UNL085-P1-PAE73476.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE73476.fa >> extend.fa
python end_extend.py 20200331-UNL085-P1-PAE76301.paf | awk '{print $1}' - | sort | uniq - > 20200331-UNL085-P1-PAE76301.list && seqkit grep -f 20200331-UNL085-P1-PAE76301.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE76301.fa >> extend.fa
python end_extend.py 20200331-UNL085-P1-PAE76304.paf | awk '{print $1}' - | sort | uniq - > 20200331-UNL085-P1-PAE76304.list && seqkit grep -f 20200331-UNL085-P1-PAE76304.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE76304.fa >> extend.fa
python end_extend.py 20200331-UNL085-P1-PAE77443.paf | awk '{print $1}' - | sort | uniq - > 20200331-UNL085-P1-PAE77443.list && seqkit grep -f 20200331-UNL085-P1-PAE77443.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200331-UNL085-P1-PAE77443.fa >> extend.fa
python end_extend.py 20200402-UNL085-P1-PAE66442.paf | awk '{print $1}' - | sort | uniq - > 20200402-UNL085-P1-PAE66442.list && seqkit grep -f 20200402-UNL085-P1-PAE66442.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200402-UNL085-P1-PAE66442.fa >> extend.fa
python end_extend.py 20200403-UNL085-P1-PAE59748.paf | awk '{print $1}' - | sort | uniq - > 20200403-UNL085-P1-PAE59748.list && seqkit grep -f 20200403-UNL085-P1-PAE59748.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200403-UNL085-P1-PAE59748.fa >> extend.fa
python end_extend.py 20200403-UNL085-P1-PAE63133.paf | awk '{print $1}' - | sort | uniq - > 20200403-UNL085-P1-PAE63133.list && seqkit grep -f 20200403-UNL085-P1-PAE63133.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200403-UNL085-P1-PAE63133.fa >> extend.fa
python end_extend.py 20200403-UNL085-P1-PAE65508.paf | awk '{print $1}' - | sort | uniq - > 20200403-UNL085-P1-PAE65508.list && seqkit grep -f 20200403-UNL085-P1-PAE65508.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200403-UNL085-P1-PAE65508.fa >> extend.fa
python end_extend.py 20200404-UNL085-P1-PAE58899.paf | awk '{print $1}' - | sort | uniq - > 20200404-UNL085-P1-PAE58899.list && seqkit grep -f 20200404-UNL085-P1-PAE58899.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE58899.fa >> extend.fa
python end_extend.py 20200404-UNL085-P1-PAE59636.paf | awk '{print $1}' - | sort | uniq - > 20200404-UNL085-P1-PAE59636.list && seqkit grep -f 20200404-UNL085-P1-PAE59636.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE59636.fa >> extend.fa
python end_extend.py 20200404-UNL085-P1-PAE62586.paf | awk '{print $1}' - | sort | uniq - > 20200404-UNL085-P1-PAE62586.list && seqkit grep -f 20200404-UNL085-P1-PAE62586.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE62586.fa >> extend.fa
python end_extend.py 20200404-UNL085-P1-PAE63133.paf | awk '{print $1}' - | sort | uniq - > 20200404-UNL085-P1-PAE63133.list && seqkit grep -f 20200404-UNL085-P1-PAE63133.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE63133.fa >> extend.fa
python end_extend.py 20200404-UNL085-P1-PAE64841.paf | awk '{print $1}' - | sort | uniq - > 20200404-UNL085-P1-PAE64841.list && seqkit grep -f 20200404-UNL085-P1-PAE64841.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200404-UNL085-P1-PAE64841.fa >> extend.fa
python end_extend.py 20200405-UNL085-P1-PAE55943.paf | awk '{print $1}' - | sort | uniq - > 20200405-UNL085-P1-PAE55943.list && seqkit grep -f 20200405-UNL085-P1-PAE55943.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE55943.fa >> extend.fa
python end_extend.py 20200405-UNL085-P1-PAE58455.paf | awk '{print $1}' - | sort | uniq - > 20200405-UNL085-P1-PAE58455.list && seqkit grep -f 20200405-UNL085-P1-PAE58455.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE58455.fa >> extend.fa
python end_extend.py 20200405-UNL085-P1-PAE59610.paf | awk '{print $1}' - | sort | uniq - > 20200405-UNL085-P1-PAE59610.list && seqkit grep -f 20200405-UNL085-P1-PAE59610.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE59610.fa >> extend.fa
python end_extend.py 20200405-UNL085-P1-PAE64851.paf | awk '{print $1}' - | sort | uniq - > 20200405-UNL085-P1-PAE64851.list && seqkit grep -f 20200405-UNL085-P1-PAE64851.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE64851.fa >> extend.fa
python end_extend.py 20200405-UNL085-P1-PAE69208.paf | awk '{print $1}' - | sort | uniq - > 20200405-UNL085-P1-PAE69208.list && seqkit grep -f 20200405-UNL085-P1-PAE69208.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE69208.fa >> extend.fa
python end_extend.py 20200405-UNL085-P1-PAE69448.paf | awk '{print $1}' - | sort | uniq - > 20200405-UNL085-P1-PAE69448.list && seqkit grep -f 20200405-UNL085-P1-PAE69448.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200405-UNL085-P1-PAE69448.fa >> extend.fa
python end_extend.py 20200406-UNL085-P1-PAE69448.paf | awk '{print $1}' - | sort | uniq - > 20200406-UNL085-P1-PAE69448.list && seqkit grep -f 20200406-UNL085-P1-PAE69448.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200406-UNL085-P1-PAE69448.fa >> extend.fa
python end_extend.py 20200406-UNL085-P5-PAE70217.paf | awk '{print $1}' - | sort | uniq - > 20200406-UNL085-P5-PAE70217.list && seqkit grep -f 20200406-UNL085-P5-PAE70217.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200406-UNL085-P5-PAE70217.fa >> extend.fa
python end_extend.py 20200407-UNL085-P5-PAE66590.paf | awk '{print $1}' - | sort | uniq - > 20200407-UNL085-P5-PAE66590.list && seqkit grep -f 20200407-UNL085-P5-PAE66590.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200407-UNL085-P5-PAE66590.fa >> extend.fa
python end_extend.py 20200408-UNL085-P5-PAE69418.paf | awk '{print $1}' - | sort | uniq - > 20200408-UNL085-P5-PAE69418.list && seqkit grep -f 20200408-UNL085-P5-PAE69418.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200408-UNL085-P5-PAE69418.fa >> extend.fa
python end_extend.py 20200409-UNL085-P5-PAE46763.paf | awk '{print $1}' - | sort | uniq - > 20200409-UNL085-P5-PAE46763.list && seqkit grep -f 20200409-UNL085-P5-PAE46763.list /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200409-UNL085-P5-PAE46763.fa >> extend.fa
python end_extend.py 20191219-UNL085-P5-PAE34153.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20191230-UNL085-P1-PAE32963.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20191231-UNL085-P1-PAE32963.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200117-UNL085-P5-PAE39466.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200118-UNL085-P5-PAE39466.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200312-UNL085-P1-PAE30600.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200313-UNL085-P1-PAE30600.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200328-UNL085-P1-PAE78052.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200329-UNL085-P1-PAE78052.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200330-UNL085-P1-PAE72324.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200330-UNL085-P1-PAE73001.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200330-UNL085-P1-PAE74959.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200331-UNL085-P1-PAE73476.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200331-UNL085-P1-PAE76301.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200331-UNL085-P1-PAE76304.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200331-UNL085-P1-PAE77443.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200402-UNL085-P1-PAE66442.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200403-UNL085-P1-PAE59748.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200403-UNL085-P1-PAE63133.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200403-UNL085-P1-PAE65508.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200404-UNL085-P1-PAE58899.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200404-UNL085-P1-PAE59636.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200404-UNL085-P1-PAE62586.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200404-UNL085-P1-PAE63133.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200404-UNL085-P1-PAE64841.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200405-UNL085-P1-PAE55943.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200405-UNL085-P1-PAE58455.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200405-UNL085-P1-PAE59610.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200405-UNL085-P1-PAE64851.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200405-UNL085-P1-PAE69208.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200405-UNL085-P1-PAE69448.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200406-UNL085-P1-PAE69448.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200406-UNL085-P5-PAE70217.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200407-UNL085-P5-PAE66590.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200408-UNL085-P5-PAE69418.paf | awk '{print $1"\t"$2 >> $6".len"}'
python end_extend.py 20200409-UNL085-P5-PAE46763.paf | awk '{print $1"\t"$2 >> $6".len"}'

python end_extend.py 20191219-UNL085-P5-PAE34153.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20191230-UNL085-P1-PAE32963.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20191231-UNL085-P1-PAE32963.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200117-UNL085-P5-PAE39466.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200118-UNL085-P5-PAE39466.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200312-UNL085-P1-PAE30600.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200313-UNL085-P1-PAE30600.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200328-UNL085-P1-PAE78052.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200329-UNL085-P1-PAE78052.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200330-UNL085-P1-PAE72324.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200330-UNL085-P1-PAE73001.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200330-UNL085-P1-PAE74959.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200331-UNL085-P1-PAE73476.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200331-UNL085-P1-PAE76301.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200331-UNL085-P1-PAE76304.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200331-UNL085-P1-PAE77443.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200402-UNL085-P1-PAE66442.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200403-UNL085-P1-PAE59748.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200403-UNL085-P1-PAE63133.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200403-UNL085-P1-PAE65508.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200404-UNL085-P1-PAE58899.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200404-UNL085-P1-PAE59636.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200404-UNL085-P1-PAE62586.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200404-UNL085-P1-PAE63133.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200404-UNL085-P1-PAE64841.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200405-UNL085-P1-PAE55943.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200405-UNL085-P1-PAE58455.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200405-UNL085-P1-PAE59610.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200405-UNL085-P1-PAE64851.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200405-UNL085-P1-PAE69208.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200405-UNL085-P1-PAE69448.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200406-UNL085-P1-PAE69448.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200406-UNL085-P5-PAE70217.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200407-UNL085-P5-PAE66590.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200408-UNL085-P5-PAE69418.paf | awk '{print $0 >> $6".paf"}'
python end_extend.py 20200409-UNL085-P5-PAE46763.paf | awk '{print $0 >> $6".paf"}'
