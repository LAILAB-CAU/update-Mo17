#!/usr/bin/perl
use strict;
use warnings;

my ($inforFile,$contigBedFile) = @ARGV;

open CL,"$contigBedFile" or die;
my %hashContigBed;
my @contigArray;
while(<CL>){
	chomp;
	my ($contig,$start,$end) = split /\s+/,$_;
	push @contigArray, $contig;
	push @{$hashContigBed{$contig}},"$start\t$end";
}
close CL;

open INFOR, "$inforFile" or die;
while(<INFOR>){
	chomp;
	next if(/^#/);
	my ($read2,$read2Length,$read2start,$read2end,$coverage,$identity,$read1,$read1start,$read1end,$direction,$mapq) = split /\s+/,$_;
	
	my $refstart;
	my $refend;
	if(grep {$_ eq $read1} @contigArray){
		foreach my $showRegion (@{$hashContigBed{$read1}}){
			my ($showRegionStart,$showRegionEnd) = split /\s+/,$showRegion;
			if($read1start <= $showRegionEnd and $read1end >= $showRegionStart){
				($refstart,$refend) = ($showRegionStart,$showRegionEnd);
				open CORR, ">>$read1\_$refstart\_$refend.coor" or die;
				if($direction == 0 or $direction == 2048){
					print CORR "$read1\t$read2\t$read1start\t$read1end\t$read2start\t$read2end\n";
				}
				elsif($direction == 16 or $direction == 2064){
					print CORR "$read1\t$read2\t$read1start\t$read1end\t$read2end\t$read2start\n";
				}
				close CORR;
				next if($coverage < 0.5);

				open KARYO, ">>$read1\_$refstart\_$refend.k" or die;
				open BED, ">>$read1\_$refstart\_$refend.bed" or die;
				print KARYO "$read1\t$refstart\t$refend\t$read2\t1\t$read2Length\n";
				print BED "$read2\t1\t$read2Length\n";
				close KARYO;close BED;
			}
		}
	}
}
close INFOR;
