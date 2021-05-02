#!/usr/env/perl 
use strict;
use warnings;

my ($baminfor, $output_bed_f,$output_bed_n) = @ARGV;    # 从命令中读取参数 第一个参数是从bam文件转化来的infor文件 第二个是要输出的bed文件 第三个是基因组大小文件

open BAM, "$baminfor" or die "Can't open .bam.infor file: $!\n";
open OUTF, ">$output_bed_f" or die "Can't write into .bed output file: $!\n";
open OUTN, ">$output_bed_n" or die "Can't write into .bed output file: $!\n";
while(my $line = <BAM>){    # 逐行读取.bam.infor文件
    chomp $line;    # 去掉行尾的换行符
    next if($line =~ /^#/); # 跳过标题行
    my ($queryName ,        # 拆分每一列
    $queryLength,
    $queryAlignedStart ,
    $queryAlignedEnd   ,
    $coverage    ,
    $identity    ,
    $ref ,
    $refStart   ,
    $refEnd,
    $flag,
    $mappingQuality) = split /\s+/,$line;
    print OUTN "$ref\t$refStart\t$refEnd\n"; # 输出这一条read比对到的基因组区域到.bed文件中
	next if($coverage < 0.85);  # 我们认为至少85%以上的序列比对到基因组上的reads才算mapped的read
    print OUTF "$ref\t$refStart\t$refEnd\n"; # 输出这一条read比对到的基因组区域到.bed文件中
}
close BAM;
close OUTF;
close OUTN;