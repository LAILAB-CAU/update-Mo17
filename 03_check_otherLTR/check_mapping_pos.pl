#!/usr/bin/perl
use strict;
use warnings;

my ($list,$infor) = @ARGV;
my %hashList;
open LIST, "$list" or die;
while(<LIST>){
	chomp;
	$hashList{$_} = 1;
}
close LIST;

open OUT, ">refind_unmapped_read.txt" or die;
open INFOR, "$infor" or die;
while(<INFOR>){
	chomp;
	next if($_ =~ /^#/); # 跳过标题行
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
    $mappingQuality) = split /\s+/;
	if(exists $hashList{$queryName}){
		if($coverage >= 0.85){
        	print OUT "$queryName\t$queryLength\t$ref\t$refStart\t$refEnd\n"; # 输出这一条mapped read比对到的基因组区域到.bed文件中
    	}
	}
}
close INFOR;
close OUT;