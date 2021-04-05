#!/usr/bin/perl
use strict;
use warnings;

my ($infor,$location,$out) = @ARGV;

my ($target,$start,$end) = split /:/,$location;
open IN, "$infor" or die;
open OUT, ">$out.temp.list" or die;
while (<IN>){
	chomp;
	next if (/^#/);
	my ($query_name,
		$query_length,
		$query_aligned_start,
		$query_aligned_end,
		$coverage,
		$Identity,
		$ref,
		$ref_start,
		$ref_end,
		$flag,
		$mapping_quality) = split /\s+/;
	
	if($ref eq $target and $ref_start <= $end and $ref_end >= $start){
		print OUT "$query_name\n";
	}
}
close IN;
close OUT;
system("sort $out.temp.list | uniq - > $out");
system("rm $out.temp.list");