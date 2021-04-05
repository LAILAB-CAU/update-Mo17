#!/usr/bin/perl
use strict;
use warnings;

my ($readLen,$repeatAnno,$type,$out) = @ARGV;

open LEN, "$readLen" or die;
my %hashReadLen;
while (<LEN>){
	chomp;
	my @array = split /\s+/;
	$hashReadLen{$array[0]} = $array[-1];
}
close LEN;

open ANNO, "$repeatAnno" or die;
my %hashAnnoLen;
while (<ANNO>){
	chomp;
	my @array = split /\s+/;
	if($array[3] eq $type){
		$hashAnnoLen{$array[0]} += $array[2] - $array[1];
	}
}
close ANNO;

open OUT, ">$out" or die;
foreach my $read (sort {$hashAnnoLen{$b} <=> $hashAnnoLen{$a}} keys %hashAnnoLen){
	next if($hashReadLen{$read} < 150000);
	next if($hashAnnoLen{$read} < 5000);
	print OUT "$read\t$hashAnnoLen{$read}\t$hashReadLen{$read}\n";
}
close OUT;