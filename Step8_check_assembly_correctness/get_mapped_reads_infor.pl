#!/usr/env/perl 
use strict;
use warnings;

my ($baminfor, $output_bed) = @ARGV;    # 从命令中读取参数 第一个参数是从bam文件转化来的infor文件 第二个是要输出的bed文件 第三个是基因组大小文件

open BAM, "$baminfor" or die "Can't open .bam.infor file: $!\n";
open OUT, ">$output_bed" or die "Can't write into .bed output file: $!\n";

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
    next if($coverage < 0.85);  # 我们认为至少85%以上的序列比对到基因组上的reads才算mapped的read
    next if($queryLength < 200000);  # 只展示200Kb以上的reads
    if($flag == 0 || $flag == 2048){    #判断reads是正向比对还是反向比对 并输出reads在比对位置之外的overhang部分长度
        my ($leftOverhang,$rightOverhang) = ($queryAlignedStart,$queryLength - $queryAlignedEnd);
        print OUT "$ref\t$refStart\t$refEnd\t$leftOverhang\t$rightOverhang\n";
    }
    else{
        my ($leftOverhang,$rightOverhang) = ($queryLength - $queryAlignedEnd,$queryAlignedStart);
        print OUT "$ref\t$refStart\t$refEnd\t$leftOverhang\t$rightOverhang\n";
    }
}
close BAM;
close OUT;