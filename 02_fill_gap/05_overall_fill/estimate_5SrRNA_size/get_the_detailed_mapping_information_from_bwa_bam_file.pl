#!/usr/bin/perl
use strict;
die usage() if @ARGV == 0;
print "#Query_name\tQuery_length\tQuery_aligned_start\tQuery_aligned_end\tCoverage\tIdentity\tRef\tRef_start\tRef_end\tFLAG\tMapping_quality\tCIGAR\n";
open NEW,"samtools view $ARGV[0] |" or die;
while(<NEW>){
    chomp;
    my @array = split /\s+/;
    next if ($array[4] < $ARGV[1]);
    my $match_bases = 0;
    while($array[5] =~ /(\d+)M/g){
        $match_bases+=$1;
    }
    my $insetion_bases = 0;
    while($array[5] =~ /(\d+)I/g){
        $insetion_bases+=$1;
    }
    my $deletion_bases = 0;
    while($array[5] =~ /(\d+)D/g){
        $deletion_bases+=$1;
    }
    my $left_clipped_bases = 0;
    if($array[5] =~ /^(\d+)S/ or $array[5] =~ /^(\d+)H/){
        $left_clipped_bases = $1;
    }
    my $right_clipped_bases = 0;
    if($array[5] =~ /(\d+)S$/ or $array[5] =~ /(\d+)H$/){
        $right_clipped_bases = $1;
    }
    $_ =~ /NM:i:(\d+)\s+/;
    my $edit_distance = $1;
    
    if($array[1] == 0 or $array[1] == 2048 or $array[1] == 83 or $array[1] == 163){
        my $query_length = $left_clipped_bases + $right_clipped_bases + $match_bases + $insetion_bases;
        my $query_start = $left_clipped_bases;
        my $ref_start = $array[3];
        my $query_aligned_length = $match_bases + $insetion_bases;
        my $ref_aligned_length = $match_bases + $deletion_bases;
        my $query_end = $left_clipped_bases + $query_aligned_length;
        my $ref_end = $ref_start + $ref_aligned_length;
        my $coverage = $query_aligned_length/$query_length;
        my $identity = ($query_aligned_length - $edit_distance)/$query_aligned_length;
        if($array[0] =~ /:/){
            #my ($contig,$region) = split /:/,$array[0];
            #my ($region_start,$region_end) = split /-/,$region;
            #my $start = $region_start + $query_start;
            #my $end = $region_start + $query_end;
            ##print "$contig\t$query_length\t$start\t$end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\t$array[5]\n";
            #print "$contig\t$query_length\t$start\t$end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\n";
            print "$array[0]\t$query_length\t$query_start\t$query_end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\n";
        }
        else{
            #print "$array[0]\t$query_length\t$query_start\t$query_end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\t$array[5]\n";
            print "$array[0]\t$query_length\t$query_start\t$query_end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\n";
        }
    }
    elsif($array[1] == 16 or $array[1] == 2064 or $array[1] == 99 or $array[1] == 147){
        my $query_length = $left_clipped_bases + $right_clipped_bases + $match_bases + $insetion_bases;
        my $query_start = $right_clipped_bases;
        my $ref_start = $array[3];
        my $query_aligned_length = $match_bases + $insetion_bases;
        my $ref_aligned_length = $match_bases + $deletion_bases;
        my $query_end = $right_clipped_bases + $query_aligned_length;
        my $ref_end = $ref_start + $ref_aligned_length;
        my $coverage = $query_aligned_length/$query_length;
        my $identity = ($query_aligned_length - $edit_distance)/$query_aligned_length;
        if($array[0] =~ /:/){
            #my ($contig,$region) = split /:/,$array[0];
            #my ($region_start,$region_end) = split /-/,$region;
            #my $start = $region_start + $query_start;
            #my $end = $region_start + $query_end;
            ##print "$contig\t$query_length\t$start\t$end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\t$array[5]\n";
            #print "$contig\t$query_length\t$start\t$end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\n";
            print "$array[0]\t$query_length\t$query_start\t$query_end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\n";
        }
        else{
            #print "$array[0]\t$query_length\t$query_start\t$query_end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\t$array[5]\n";
            print "$array[0]\t$query_length\t$query_start\t$query_end\t$coverage\t$identity\t$array[2]\t$ref_start\t$ref_end\t$array[1]\t$array[4]\n";
        }
    }
}
close NEW;
        
sub usage{
    my $die =<<DIE;
    usage : perl *.pl ZmB73_5b_FGS_genes.align_Mo17_scaffold.bam mapping_quality
    ## this script is used to get the detailed information of bwa mapping information
DIE
}
