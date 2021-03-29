#!/usr/bin/perl
use strict;
use warnings;


die usage() if @ARGV == 0;


my ($mapFile,$merge_distance,$output) = @ARGV;


## this hash table was used to judge if the scaffolds was placed reversly
my %hash_query_len;
print "Start reading tag coordinates.................\n";
my $total_tag_len;
open NEW,"$mapFile" or die;
while(<NEW>){
    chomp;
    # 读取minimap2产生的paf文件 输出每个query序列比对到的位置
    my @array = split /\s+/;
    # 将query序列的长度存进哈希hash_query_len中
    $hash_query_len{$array[0]} = $array[1];
    # 每一个query序列都写一个bed文件 文件中写入query比对到ref的位置
    open NEW1,">>./$array[0].coor.bed" or die;
    # 这一个alignment在ref上比对长度
    my $tag_len = $array[8]-$array[7];
    $total_tag_len += $tag_len;
    # 输出的bed文件的格式
    # refID refstart    refend  irection
    print NEW1 "$array[5]\t$array[7]\t$array[8]\t$tag_len\t$array[0]:$array[2]-$array[3]\t$array[4]\n";
}
close NEW;
print "Tag reading Done...............($total_tag_len bps)\n\n";
print "#####################################################################\n";


open NEW,">$output" or die;
my @files = <./*.coor.bed>;
foreach my $file(@files){
    print "Processing scaffold: $file \n";
    
    system("sort -k 1,1 -k 2,2n -k 3,3n $file >$file.sorted");
    # 将上一步产生的tags merge
    system("bedtools merge -s -c 6  -o distinct -d $merge_distance  -i $file.sorted >$file.sorted.merged");
    ## get the region with the most clustered tags
    open NEWTEMP, "$file.sorted.merged" or die;
    open TEMPO, ">$file.sorted.merged.len" or die;
    while(<NEWTEMP>){
        chomp;
        my @tempA = split /\s+/;
        my $tempLen = $tempA[2] - $tempA[1];
        print TEMPO "$_\t$tempLen\n";
    }
    close NEWTEMP;
    close TEMPO;
    system("rm $file.sorted.merged");
    system("sort -k 5,5nr $file.sorted.merged.len >$file.sorted.merged.sorted");


    open NEW1,"$file.sorted.merged.sorted" or die;
    chomp(my $header = <NEW1>);
    my @aa = split /\s+/,$header;
    my $target_chr = $aa[0];
    my $target_start = $aa[1];
    my $target_end = $aa[2];
    my $target_len = $aa[2] - $aa[1];
    my $target_direction = $aa[-2];
    ## the scaffold name
    my $temp = $file;
    $temp =~ s/\.\///;
    $temp =~ s/\.coor\.bed//;
    print "Scaffold name was $temp\n";
    # print "The high-confidence anchored region is: $target_chr:$target_start-$target_end\n";

    #my @tag_number = split /,/,$aa[-1];
    if($target_len >= $hash_query_len{$temp}*0.5){
        print "The high-confidence anchored region is: $target_chr:$target_start-$target_end\n";
        my @array_anchored_tags;
        open NEW2,"$file" or die;
        while(<NEW2>){
            chomp;
            my @array = split /\s+/;
            ## the coordinates in scaffolds were already sorted
            if($array[0] eq "$target_chr" and $array[2] > $target_start and $array[2] <= $target_end){
                push @array_anchored_tags,$array[2];
            }
        }
        close NEW2;




        print NEW "$target_chr\t$target_start\t$target_end\t$target_len\t$target_direction\t$temp\t$hash_query_len{$temp}\n";


    }
    print "#####################################################################\n";
    

    system("rm $file");
    system("rm $file.sorted");
    system("rm $file.sorted.merged.len");
    system("rm $file.sorted.merged.sorted");
}
close NEW;


system("sort -k 1,1 -k 2,2n -k 3,3n $output >$output.sorted");





sub usage{
    my $die =<<DIE;
    usage : perl *.pl Lu_2015_NatCommun_panGenomeAnchors20150219.bwa_mem.huangzaosi.scaffold.q60.sorted.coor merge_distance minimal_supporting_marker output.coor
DIE
}
