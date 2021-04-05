#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;

my($bed,$output,$highlight) = @ARGV;

my @colors_forSSR = ('#fffffb','#d1c7b7','#1d1626','#b54334','#ef5b9c','#444693','#cde6c7','#d5c59f','#987165','#fab27b','#8A2BE2','#6A5ACD','#DA70D6','#DDA0DD','#B0C4DE');
my @tag = ('AGT','TAG','GTA','CTA','TAC','ACT');
my @ctg = ('CTG','TGC','GCT','CAG','AGC','GCA');
my @gtg = ('GTG','TGG','GGT','CAC','ACC','CCA');
my @caacag = ('CAACAG','AACAGC','ACAGCA','CAGCAA','AGCAAC','GCAACA','CTGTTG','GCTGTT','TGCTGT','TTGCTG','GTTGCT','TGTTGC');
my @aaaccct = ('AAACCCT','AACCCTA','ACCCTAA','CCCTAAA','CCTAAAC','CTAAACC','TAAACCC','AGGGTTT','GGGTTTA','GGTTTAG','GTTTAGG','TTTAGGG','TTAGGGT','TAGGGTT');
open NEW, "$bed" or die;
open OUT, ">$output" or die;
open OUT2, ">$highlight" or die;
my %hash_ssr;

while(<NEW>){
    chomp;
    my @array = split /\s+/;
    if($array[-1]=~/LTR/){
        if($array[-1]=~/Gypsy/){
            print OUT "$array[0]\t$array[1]\t$array[2]\tGypsy\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\ttan\n";
        }
        elsif($array[-1]=~/Copia/){
            print OUT "$array[0]\t$array[1]\t$array[2]\tCopia\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\ttomato\n";
        }
        else{
            print OUT "$array[0]\t$array[1]\t$array[2]\tother_LTR\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\t#B0C4DE\n";
        }
    }
    elsif($array[-1]=~/^DNA/){
        print OUT "$array[0]\t$array[1]\t$array[2]\tDNATE\n";
        print OUT2 "$array[0]\t$array[1]\t$array[2]\tgreen\n";
    }
    elsif($array[-1]=~/MITE/){
        print OUT "$array[0]\t$array[1]\t$array[2]\tMITE\n";
        print OUT2 "$array[0]\t$array[1]\t$array[2]\tdarkolivegreen\n";
    }
    elsif($array[-1]=~/LINE/){
        print OUT "$array[0]\t$array[1]\t$array[2]\tLINE\n";
        print OUT2 "$array[0]\t$array[1]\t$array[2]\tbrown\n";
    }
    elsif($array[-1]=~/SINE/){
        print OUT "$array[0]\t$array[1]\t$array[2]\tSINE\n";
        print OUT2 "$array[0]\t$array[1]\t$array[2]\twheat\n";
    }
    elsif($array[-1]=~/Satellite/){
        if($array[-1]=~/cent/){
            print OUT "$array[0]\t$array[1]\t$array[2]\tSatellite_centr\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\tyellowgreen\n";
        }
        else{
            print OUT "$array[0]\t$array[1]\t$array[2]\tSatellite\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\taqua\n";
        }
    }
    elsif($array[-1]=~/knob/){
        print OUT "$array[0]\t$array[1]\t$array[2]\tknob\n";
        print OUT2 "$array[0]\t$array[1]\t$array[2]\tmaroon\n";
    }
    elsif($array[-1]=~/Simple_repeat/){
        my $ssrunit = $array[3] =~ s/\((\w+)\)n/$1/r;
        my $unit_defined = 0;
        foreach my $the_unique_unit (@tag){
            if($ssrunit eq  $the_unique_unit || $ssrunit eq  $the_unique_unit x 2){
                print OUT "$array[0]\t$array[1]\t$array[2]\tTAG\t$ssrunit\n";
                print OUT2 "$array[0]\t$array[1]\t$array[2]\tblue\n";
                $unit_defined = 1;
                last;
            }
        }
        foreach my $the_unique_unit (@ctg){
            if($ssrunit eq  $the_unique_unit || $ssrunit eq  $the_unique_unit x 2){
                print OUT "$array[0]\t$array[1]\t$array[2]\tCTG\t$ssrunit\n";
                print OUT2 "$array[0]\t$array[1]\t$array[2]\t#ef5b9c\n";
                $unit_defined = 1;
                last;
            }
        }
        foreach my $the_unique_unit (@gtg){
            if($ssrunit eq  $the_unique_unit || $ssrunit eq  $the_unique_unit x 2){
                print OUT "$array[0]\t$array[1]\t$array[2]\tGTG\t$ssrunit\n";
                print OUT2 "$array[0]\t$array[1]\t$array[2]\tred\n";
                $unit_defined = 1;
                last;
            }
        }
        foreach my $the_unique_unit (@caacag){
            if($ssrunit eq  $the_unique_unit || $ssrunit eq  $the_unique_unit x 2){
                print OUT "$array[0]\t$array[1]\t$array[2]\tCAACAG\t$ssrunit\n";
                print OUT2 "$array[0]\t$array[1]\t$array[2]\t#8A2BE2\n";
                $unit_defined = 1;
                last;
            }
        }
        foreach my $the_unique_unit (@aaaccct){
            if($ssrunit eq  $the_unique_unit || $ssrunit eq  $the_unique_unit x 2){
                print OUT "$array[0]\t$array[1]\t$array[2]\tAAACCCT\t$ssrunit\n";
                print OUT2 "$array[0]\t$array[1]\t$array[2]\torange\n";
                $unit_defined = 1;
                last;
            }
        }
        if($unit_defined == 0){
            print OUT "$array[0]\t$array[1]\t$array[2]\totherSSR\t$ssrunit\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\t#444693\n";
        }
        
        # if(grep /$ssrunit/,@tag){
        #     print OUT "$array[0]\t$array[1]\t$array[2]\tTAG\n";
        #     print OUT2 "$array[0]\t$array[1]\t$array[2]\tblue\n";
        # }
        # elsif(grep /$ssrunit/,@ctg){
        #     print OUT "$array[0]\t$array[1]\t$array[2]\tCTG\n";
        #     print OUT2 "$array[0]\t$array[1]\t$array[2]\t#ef5b9c\n";
        # }
        # elsif(grep /$ssrunit/,@gtg){
        #     print OUT "$array[0]\t$array[1]\t$array[2]\tGTG\n";
        #     print OUT2 "$array[0]\t$array[1]\t$array[2]\tred\n";
        # }
        # elsif(grep /$ssrunit/,@caacag){
        #     print OUT "$array[0]\t$array[1]\t$array[2]\tCAACAG\n";
        #     print OUT2 "$array[0]\t$array[1]\t$array[2]\t#8A2BE2\n";
        # }
        # else{
        #     print OUT "$array[0]\t$array[1]\t$array[2]\totherSSR\n";
        #     print OUT2 "$array[0]\t$array[1]\t$array[2]\t#444693\n";
        # }
    }
    elsif($array[-1]=~/rDNA/){
        print OUT "$array[0]\t$array[1]\t$array[2]\trDNA_spacer\n";
        print OUT2 "$array[0]\t$array[1]\t$array[2]\tyellow\n";
    }
    elsif($array[-1]=~/rRNA/){
        if($array[-2]=~/LSU/){
            print OUT "$array[0]\t$array[1]\t$array[2]\tLSU_rDNA_gene\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\tblack\n";
        }
        else{
            print OUT "$array[0]\t$array[1]\t$array[2]\tSSU_rDNA_gene\n";
            print OUT2 "$array[0]\t$array[1]\t$array[2]\tpurple\n";
        }
    }
    elsif($array[-1]=~/subtelomere/){
        print OUT "$array[0]\t$array[1]\t$array[2]\ttelomere\n";
        print OUT2 "$array[0]\t$array[1]\t$array[2]\torange\n";
    }
}
close NEW;
close OUT;
close OUT2;
