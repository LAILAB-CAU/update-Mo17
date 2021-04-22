#!/usr/bin/perl
use strict;
use warnings;

my ($depth1,$depth2,$abnormal_value) = @ARGV;
my ($outDepth1,$outDepth2) = ($depth1."ab",$depth2."ab");

my %hashDepth2;
open DEP2, "$depth2" or die;
while(<DEP2>){
	chomp;
	my @array = split /\s+/;
	$hashDepth2{"$array[0]\t$array[1]\t$array[2]"} = "$array[4]\t$array[4]";
}
close DEP2;

open OUT1, ">$outDepth1" or die;
open OUT2, ">$outDepth2" or die;
open DEP1, "$depth1" or die;
while(<DEP1>){
	chomp;
	my @array = split /\s+/;
	if($array[3] < $abnormal_value or $array[4] < $abnormal_value){
		my $out2Line = $hashDepth2{"$array[0]\t$array[1]\t$array[2]"};
		print OUT1 "$_\n";
		print OUT2 "$array[0]\t$array[1]\t$array[2]\t$out2Line\n";
	}
}
close DEP1;
close OUT1;
close OUT2;