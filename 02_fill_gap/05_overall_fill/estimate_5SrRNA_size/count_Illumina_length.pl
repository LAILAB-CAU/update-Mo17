#!/usr/bin/perl
use strict;
use warnings;

my ($infor, $bedFor, $bedRev) = @ARGV;
my %hashRead;
open INFOR, "$infor" or die;
open OUT, ">$bedFor" or die;
open OUT2, ">$bedRev" or die;
while(my $line = <INFOR>){
	chomp $line;
	my ($query_name,
		$query_length,
		$query_aligned_start,
		$query_aligned_end,
		$coverage,
		$identity,
		$ref,
		$ref_start,
		$ref_end,
		$flag,
		$mapping_quality) = split(/\s+/,$line);
	next if($line =~ /^#/);
	if(exists $hashRead{$query_name} and $hashRead{$query_name} >= 1){
		print OUT2 "$query_name\t$query_aligned_start\t$query_aligned_end\n";
	}
	else{
		print OUT  "$query_name\t$query_aligned_start\t$query_aligned_end\n";
		$hashRead{$query_name} = 1;
	}
}
close OUT;
close OUT2;
close INFOR;
