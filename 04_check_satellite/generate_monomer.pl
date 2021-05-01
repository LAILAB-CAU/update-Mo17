#!/usr/bin/perl
use strict;
use warnings;

my ($tsv) = @ARGV;

open NEW, "$tsv" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	my $monomer = (split(/#/,$array[1]))[0];
	open OUT, ">>$monomer.bed" or die;
	print OUT "$array[0]\t$array[2]\t$array[3]\n";
	close OUT;
}
close NEW;