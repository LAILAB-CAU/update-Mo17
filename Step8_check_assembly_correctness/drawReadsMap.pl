#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($pseudomolecule,$bed,$mapped) = @ARGV;

my %hash_scaffolds;
my $seq_name1;
my %hash_sca_seq;
open NEW,"$pseudomolecule" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    $hash_scaffolds{"$array[0]\t$array[1]\t$array[2]"} = $array[2] - $array[1];
}
close NEW;

my %hashMapped;
open NEW,"$mapped" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    push @{$hashMapped{"$array[0]\t$array[1]\t$array[2]"}},"$array[4]\t$array[5]\t$array[6]\t$array[7]";
}
close NEW;

my %hashBed;
open NEW, "$bed" or die;
while(<NEW>){
    chomp;
    my @array = split /\s+/;
    $hashBed{$array[0]}{"$array[1]\t$array[2]"} = $array[3];
}
close NEW;

my $scale;
## draw the bar chart of ref_genome chromosomes
my $add_y = 100;

# my $turn = 0;
my @keyhash = keys %hash_scaffolds;
my $wcl = @keyhash;
my $svg;

my $count = 0;
my $theEndSeq;
# foreach my $key(sort {$hash_scaffolds{$b} cmp $hash_scaffolds{$a}} keys %hash_scaffolds){
foreach my $key(sort  keys %hash_scaffolds){

    my $length = $hash_scaffolds{$key};
    my $regionStart = (split /\s+/, $key)[1];
    my $regionEnd = (split /\s+/, $key)[2];
    my $seqName = (split /\s+/, $key)[0];

    my $countInPicture = $count % 1;
    my $thePictureSeq = int($count/1);
    # $theEndSeq = $thePictureSeq + 1;
    if($countInPicture == 0){
        if($thePictureSeq >= 1){
            my $out = $svg->xmlify;
            my $output = "$theEndSeq.svg";
            open SVGFILE,">$output" or die;
            print SVGFILE $out;
            close SVGFILE;
            system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $theEndSeq.pdf");
        }
        $svg = SVG->new(width=>2000, height=>5*100 + 100);
    }
    $theEndSeq = "$seqName\_$regionStart\_$regionEnd";

    my $step_len;
    # $scale决定比例尺 my $scale = 200;说明200bp为一个像素
    if($length <= 1000000){
        $scale = 1000;
        $step_len = 10000;
    }
    elsif($length <= 10000000){
        $scale = 1000;
        $step_len = 10000;
    }
    else{
        $scale = 100000;
        $step_len = 1000000;
    }
    # $step_len决定刻度的密度 $step_len = 1000说明每1Kb一个刻度
    

    
    my $y_loc = $add_y + 60 * $countInPicture;
    
    $svg->rectangle(x=>50,y=>$y_loc,width=>$length/$scale,height=>10,fill=>'grey',stroke=>'none',style => {'stroke-width'   => '0.001'});
    $svg->text(x =>350 + $length/$scale,y =>$y_loc+7, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>10, "-cdata" => "$key:$length bp");
    my $yyy = $y_loc;
    $svg->rectangle(x=>50,y=>$yyy,width=>$length/$scale,height=>1,fill=>'black',stroke=>'none');
    
    my $labelStart = $step_len * (int($regionStart/$step_len)+1);
    for(my $magnitude = $labelStart;$magnitude <= $regionStart + $length;$magnitude+= $step_len ){
        my $label = $magnitude/1000;

        # $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-2,width=>0.5,height=>1,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        if($magnitude%(5*$step_len) == 0){
            
            if($magnitude%(10*$step_len) == 0){
                $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-5,width=>2, height=>5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
                $svg->text(x =>50+($magnitude - $regionStart)/$scale,y =>$yyy-5, width => 2, height => 5, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>7, "-cdata" => "$label Kb");
                next;
            }
            $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-3,width=>0.7,height=>3,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
        else{
            $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-1.5,width=>0.5,height=>1.5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }

    foreach my $loc(keys %{$hashBed{$seqName}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        if($start >= $regionStart and $end <= $regionEnd){
            $svg->rectangle(x=>50+($start - $regionStart)/$scale,y=>$y_loc,width=>$length/$scale,height=>10,fill=>"$hashBed{$seqName}{$loc}",stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }
    $yyy += 15;
    foreach my $loc(@{$hashMapped{$key}}){
        my ($start,$end,$leftOverhang,$rightOverhang) = split /\s+/,$loc;
        my $length = $end-$start;
        $svg->line(x1=>50+($start - $regionStart)/$scale,x2=>50+($end - $regionStart)/$scale,y1=>$yyy ,y2=>$yyy ,stroke=>'black',"stroke-width"=>2);
        $svg->line(x1=>50+($start - $leftOverhang - $regionStart)/$scale,x2=>50+($start - $regionStart)/$scale,y1=>$yyy ,y2=>$yyy ,stroke=>'red',"stroke-width"=>2);
        $svg->line(x1=>50+($end - $regionStart)/$scale,x2=>50+($end + $rightOverhang - $regionStart)/$scale,y1=>$yyy ,y2=>$yyy ,stroke=>'red',"stroke-width"=>2);
        $yyy += 5;
    }


    $count += 1;
}
my $out = $svg->xmlify;
my $output = "$theEndSeq.svg";
open SVGFILE,">$output" or die;
print SVGFILE $out;
close SVGFILE;
system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $theEndSeq.pdf");

sub usage{
	my $die =<<DIE;
	usage : perl *.pl longmi.sca.fasta foxtail_millet.chr.fa *.coords output.SVG 
DIE
}
