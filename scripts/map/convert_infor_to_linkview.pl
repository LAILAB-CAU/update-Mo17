#!/usr/bin/perl
use strict;
die usage() if @ARGV == 0;

#print "Query_name\tQuery_length\tQuery_aligned_start\tQuery_aligned_end\tCoverage\tIdentity\tRef\tRef_start\tRef_end\tFLAG\tMapping_quality\tCIGAR\n";

my($baminfor,$alignment_out,$reflen,$querylen,$anchor_view,$karoytype) = @ARGV;

open NEW,"$baminfor" or die;
open NEW1, ">$alignment_out" or die;
my %hash_contig;
while(<NEW>){
    chomp;
    my @array = split /\s+/;
    next if(/Query/);

    if($array[-3] == 0 or $array[-3] == 2048){
        print NEW1 "$array[0]\t$array[2]\t$array[3]\t$array[6]\t$array[7]\t$array[8]\n";
    }
    elsif($array[-3] == 16 or $array[-3] == 2064){
        print NEW1 "$array[0]\t$array[3]\t$array[2]\t$array[6]\t$array[7]\t$array[8]\n";
    }
}
close NEW;
close NEW1;

open REF, "$reflen" or die;
my %hash_ref_len;
while(<REF>){
    chomp;
    my @array = split /\s+/;
    $hash_ref_len{$array[0]} = $array[1];
}
close REF;

open QUE, "$querylen" or die;
my %hash_que_len;
while(<QUE>){
    chomp;
    my @array = split /\s+/;
    $hash_que_len{$array[0]} = $array[1];
}
close QUE;

open ANC, "$anchor_view" or die;
open ANCOUT, ">$karoytype" or die;
my %hash_anchor;
while(<ANC>){
    chomp;
    my @array = split /\s+/;
    if(exists $hash_anchor{$array[0]}){
        push @{$hash_anchor{$array[0]}},"$array[4]:0:$hash_que_len{$array[4]}";
    }
    else{
        $hash_anchor{$array[0]} = ["$array[4]:0:$hash_que_len{$array[4]}"];
    }
}
close ANC;
foreach my $key (keys %hash_anchor){
    print ANCOUT "$key:0:$hash_ref_len{$key}\n";
    print ANCOUT join("\t",@{$hash_anchor{$key}}),"\n";
}
close ANCOUT;


        
sub usage{
    my $die =<<DIE;
    usage : perl *.pl ZmB73_5b_FGS_genes.align_Mo17_scaffold.bam alignment.out reflen querylen anchor_infor karyotype
    ## this script is used to get the files to draw colinear plot by linkview
DIE
}
