#!/usr/bin/perl
use strict;
use warnings;

my ($len,$depth,$output,$binSize) = @ARGV;

my %hashLen;
open LEN, "$len" or die;
while(my $line =<LEN>){
	chomp $line;
	my ($chr,$length) = split /\s+/,$line;
	$hashLen{$chr} = $length;
}
close LEN;

my %hashDepth;
open DEP, "$depth" or die;
while(my $line = <DEP>){
	chomp $line;
	my ($chr,$start,$end,$depth) = split /\s+/,$line;
	my ($regionStart,$regionEnd) = (int($start/$binSize)*$binSize , int($end/$binSize)*$binSize+$binSize);
	for(my $theRegion=$regionStart;$theRegion<$regionEnd;$theRegion+=$binSize){
		my ($curren_s,$current_e) = ($theRegion,$theRegion+$binSize);
		my @ss = ($start,$curren_s); @ss = sort {$b <=> $a} @ss;
		my @ee = ($end,$current_e); @ee = sort {$a <=> $b} @ee;
		$hashDepth{$chr}{"$curren_s"} += $depth*($ee[0] - $ss[0]);
	}
}
close DEP;

my %hashAveDep;
foreach my $chr(keys %hashDepth){
	foreach my $loc(keys %{$hashDepth{$chr}}){
		my $avdepth;
		if($loc+$binSize<$hashLen{$chr}){
			$avdepth = $hashDepth{$chr}{$loc}/$binSize;
		}
		else{
			my ($start,$end) = ($loc,$hashLen{$chr});
			$avdepth = $hashDepth{$chr}{$loc}/($end - $start);
		}
		
		$hashAveDep{$chr}{$loc} = $avdepth;
	}
}


open OUT, ">$output" or die;
foreach my $chr(keys %hashAveDep){
	foreach my $loc(keys %{$hashAveDep{$chr}}){
		my $avdepth;
		if($loc+$binSize<$hashLen{$chr}){
			my ($start,$end) = ($loc,$loc+$binSize);
			print OUT "$chr\t$start\t$end\t$hashAveDep{$chr}{$start}\t$hashAveDep{$chr}{$end}\n";
		}
	}
}
close OUT;