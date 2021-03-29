#!/usr/bin/perl
use strict;
use warnings;

my ($paf,$outPrefix,$targetRegion) = @ARGV;

my ($targetChr,$targetStart,$targetEnd) = split /:/,$targetRegion;

open PAF, "$paf" or die;
while(my $line = <PAF>){
    chomp $line;
    my @array = split /\s+/, $line;
    my ($query,$queryLength,$queryStart,$queryEnd,$direction,$ref,$refLength,$refStart,$refEnd) = @array[0..8];
	if($ref eq $targetChr and $refStart >= $targetStart and $refEnd <= $targetEnd){
		open BED, ">>$outPrefix.bed" or die;
		print BED "$query\t1\t$queryLength\n";
		close BED;
		open KAR, ">>$outPrefix.kar" or die;
		print KAR "$ref\t1\t$refLength\t$query\t1\t$queryLength\n";
		close KAR;
		open COOR, ">>$outPrefix.coor" or die;
		if($direction eq '+'){
			print COOR "$ref\t$query\t$refStart\t$refEnd\t$queryStart\t$queryEnd\n";
		}
		else{
			print COOR "$ref\t$query\t$refStart\t$refEnd\t$queryEnd\t$queryStart\n";
		}
		close COOR;
	}
}
close PAF;