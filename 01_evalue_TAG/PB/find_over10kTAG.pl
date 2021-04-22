#!/usr/bin/perl
use strict;
use warnings;

my ($len,$bed,$out) = @ARGV;

my %hashReadLen;
open LEN, "$len" or die;
while(<LEN>){
	chomp;
	my @line = split /\s+/;
	$hashReadLen{$line[0]} = $line[1];
}
close LEN;

my %hashBed;
open BED, "$bed" or die;
while(<BED>){
	chomp;
	my @line = split /\s+/;
	if(exists $hashReadLen{$line[0]}){
		if(@line == 5){
			$hashBed{$line[0]} += $line[2]-$line[1]+1;
		}
	}	
}
close BED;

open OUT, ">$out" or die;
foreach my $read(keys %hashBed){
	my $ratio = $hashBed{$read}/$hashReadLen{$read};
	print OUT "$read\t$ratio\t$hashReadLen{$read}\n";
}
close OUT;
system("sort -k2,2nr $out > $out.sorted");
system("rm $out");