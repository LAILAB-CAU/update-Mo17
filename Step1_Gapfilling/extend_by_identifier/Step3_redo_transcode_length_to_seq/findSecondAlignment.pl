#!/usr/env/perl
use strict;
use warnings;

my ($blastout, $output) = @ARGV;

my %hashPrint;
open (BLAST, "$blastout") or die;
open OUT, ">$output" or die;
# open OUT3, ">$output3" or die;
while (my $line = <BLAST>) {
    chomp $line;
    my @array = split /\s+/, $line;
    if($line =~ /^#/){
        next;
    }
    else{
        if(not exists $hashPrint{$array[0]} or $hashPrint{$array[0]} < 25){
            if($array[0] ne $array[2] and $array[6] == 0 and $array[7] == 0){
                # 正向
                if($array[10] < $array[11]){
                    print OUT "$line\n";
                    # if(exists $hashPrint{$array[0]}){
                    #     print OUT3 "$line\n";
                    # }
                    # else{
                    #     print OUT2 "$line\n";
                    # }
                    $hashPrint{$array[0]} += 1;
                    
                    #if($array[8] == 1 and $array[11] == $array[3]){
                    #    print OUT "$line\n";
                    #    $hashPrint{$array[0]} = 1;
                    #}
                    #elsif($array[10] == 1 and $array[9] == $array[1]){
                    #    print OUT "$line\n";
                    #    $hashPrint{$array[0]} = 1;
                    #}
                    #elsif($array[10] == 1 and $array[11] == $array[3]){
                    #    print OUT "$line\n";
                    #    $hashPrint{$array[0]} = 1;
                    #}
                    #elsif($array[8] == 1 and $array[9] == $array[1]){
                    #    print OUT "$line\n";
                    #    $hashPrint{$array[0]} = 1;
                    #}
                }
                #反向
                else{
                    print OUT "$line\n";
                    # if(exists $hashPrint{$array[0]}){
                    #     print OUT3 "$line\n";
                    # }
                    # else{
                    #     print OUT2 "$line\n";
                    # }
                    $hashPrint{$array[0]} += 1;
                    # if($array[8] == 1 and $array[10] == 1){
                    #     print OUT "$line\n";
                    #     $hashPrint{$array[0]} = 1;
                    # }
                    # elsif($array[9] == $array[1] and $array[10] == 1){
                    #     print OUT "$line\n";
                    #     $hashPrint{$array[0]} = 1;
                    # }
                    # elsif($array[10] == $array[3] and $array[11] == 1){
                    #     print OUT "$line\n";
                    #     $hashPrint{$array[0]} = 1;
                    # }
                    # elsif($array[8] == 1 and $array[9] == $array[1]){
                    #     print OUT "$line\n";
                    #     $hashPrint{$array[0]} = 1;
                    # }
                }
            }
        }
    }

}
close OUT;
close BLAST;
