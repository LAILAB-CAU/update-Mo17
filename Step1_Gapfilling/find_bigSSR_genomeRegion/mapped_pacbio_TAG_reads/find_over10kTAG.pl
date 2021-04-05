#!/usr/bin/perl
use strict;
use warnings;

my ($bed,$out) = @ARGV;

my %hashBed;
open BED, "$bed" or die;
while(<BED>){
	chomp;
	my @line = split /\s+/;
	$hashBed{"$line[0]\t$line[1]\t$line[2]"} += $line[-1];
}
close BED;

open OUT, ">$out" or die;
foreach my $window(keys %hashBed){
	if($hashBed{$window} >= 3000){
		print OUT "$window\n";
	}
}
close OUT;
system("sort -k1,1 -k2,2n $out > $out.sorted");
system("rm $out");