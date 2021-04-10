#!/usr/bin/perl
use strict;
use warnings;

my ($inputFasta,$outputFasta) = @ARGV; # 参数中设置输入文件和输出文件

# 写好change name的哈希对应表
my %hashChangeName = (
	'Contig3' => 'Contig1',
	'Contig16' => 'Contig2',
	'Contig5_chr1_valid' => 'Contig3',
	'Contig139' => 'Contig4',
	'Contig12' => 'Contig5',
	'Contig5_chr2' => 'Contig6',
	'Contig13' => 'Contig7',
	'Contig2' => 'Contig8',
	'Contig1' => 'Contig9',
	'Contig4' => 'Contig10',
	'Contig17' => 'Contig11',
	'Contig15' => 'Contig12',
	'Contig9' => 'Contig13',
	'Contig6' => 'Contig14',
	'Contig11' => 'Contig15',
	'Contig10' => 'Contig16',
	'Contig14' => 'Contig17',
	'Contig7' => 'Contig18',
	'Contig18' => 'Contig19',
	'Contig8' => 'Contig20'
);

open IN, "$inputFasta" or die; # 打开输入文件
my %hashSeq;
my $currentSeq;
while(my $line = <IN>){
	chomp $line;
	if($line =~ /^>/){
		my $name = (split(/\s+/,$line))[0];
		$currentSeq = $name =~ s/^>//r;	# 遇到序列名
		next;
	}
	else{
		$hashSeq{$currentSeq} .= $line;	# 遇到序列
	}
}
close;

open OUT, ">$outputFasta" or die; #输出改过名以后的序列
foreach my $seq (sort {$hashChangeName{$a} cmp $hashChangeName{$b}} keys %hashSeq){
	print OUT ">$hashChangeName{$seq}\n$hashSeq{$seq}\n";
}
close OUT;