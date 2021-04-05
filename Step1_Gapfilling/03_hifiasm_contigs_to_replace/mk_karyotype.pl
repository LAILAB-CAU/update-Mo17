#!/usr/bin/perl
use strict;
use warnings;

my ($workpath,$ref,$query) = @ARGV;

open NEW1, "$workpath/$ref" or die;
open NEW2, "$workpath/$query" or die;
my $count = 0;
while(my $refline = <NEW1>){
	$count++;
	chomp $refline;
	my $queryline = <NEW2>;
	chomp $queryline;
	open OUT, ">$workpath/k$count.txt" or die;
	print OUT "$refline\n$queryline";
	close OUT;
}
close NEW1;
close NEW2;
