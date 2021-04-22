#!/usr/bin/perl
use strict;
use warnings;

my ($inpaf,$outpaf) = @ARGV; # 参数中设置输入文件和输出文件

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

open IN, "$inpaf" or die; # 打开输入文件
open OUT, ">$outpaf" or die; #输出改过名以后的序列
while(my $line = <IN>){
	chomp $line;
	my @array = split(/\s+/,$line);
	if(grep { $_ eq $array[0] } keys %hashChangeName){
		$array[0] = $hashChangeName{$array[0]};
	}
	# if($array[3] eq 'maroon' or $array[3] eq 'yellowgreen'){
	# 	$array[3] = 'aqua';
	# }
	# if($array[3] eq '#444693' or $array[3] eq '#ef5b9c' or $array[3] eq '#8A2BE2' or $array[3] eq 'red'){
	# 	$array[3] = 'magenta';
	# }
	# if($array[3] eq 'wheat'){
	# 	$array[3] = 'brown';
	# }
	# if($array[3] eq 'black' or $array[3] eq 'purple'){
	# 	$array[3] = 'yellow';
	# }
	# if($array[3] eq 'darkolivegreen'){
	# 	$array[3] = 'green';
	# }
	print OUT join("\t",@array),"\n";
}
close IN;
close OUT;
