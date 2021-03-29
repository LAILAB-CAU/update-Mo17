#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($pseudomolecule,$bed,$forward,$backward,$indel) = @ARGV;

my %hash_direction;
open NEW,"$forward" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    $hash_direction{$array[0]}{"$array[1]\t$array[2]"} = '+';
}
close NEW;
open NEW,"$backward" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    $hash_direction{$array[0]}{"$array[1]\t$array[2]"} = '-';
}
close NEW;


my %hash_indel;
open NEW,"$indel" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    if($array[4] eq 'absm'){
        $hash_indel{$array[0]}{"$array[1]\t$array[2]"} = 'purple';
    }
    elsif($array[4] eq 'sm'){
        $hash_indel{$array[0]}{"$array[1]\t$array[2]"} = 'blue';
    }
    elsif($array[4] eq 'bg'){
        $hash_indel{$array[0]}{"$array[1]\t$array[2]"} = 'pink';
    }
    elsif($array[4] eq 'abbg'){
        $hash_indel{$array[0]}{"$array[1]\t$array[2]"} = 'red';
    }
    else{
        $hash_indel{$array[0]}{"$array[1]\t$array[2]"} = 'black';
    }
}
close NEW;


my %hash_scaffolds;
my $seq_name1;
my %hash_sca_seq;
open NEW,"$pseudomolecule" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    $hash_scaffolds{$array[0]} = $array[1];
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
foreach my $key(sort {$hash_scaffolds{$b} <=> $hash_scaffolds{$a}} keys %hash_scaffolds){

    my $length = $hash_scaffolds{$key};
    
    my $countInPicture = $count % 200;
    my $thePictureSeq = int($count/200);
    $theEndSeq = $thePictureSeq + 1;
    if($countInPicture == 0){
        if($thePictureSeq >= 1){
            my $out = $svg->xmlify;
            my $output = "$pseudomolecule-$thePictureSeq.svg";
            open SVGFILE,">$output" or die;
            print SVGFILE $out;
            close SVGFILE;
        }
        $svg = SVG->new(width=>1000, height=>25*200 + 100);
    }
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
    

    
    my $y_loc = $add_y + 25 * $countInPicture;
    
    $svg->rectangle(x=>50,y=>$y_loc,width=>$length/$scale,height=>10,fill=>'grey',stroke=>'none',style => {'stroke-width'   => '0.001'});
    $svg->text(x =>460 + $length/$scale,y =>$y_loc+7, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>10, "-cdata" => "$pseudomolecule  $key:$length bp");
    my $yyy = $y_loc;
    $svg->rectangle(x=>50,y=>$yyy,width=>$length/$scale,height=>1,fill=>'black',stroke=>'none');
    for(my $magnitude = 0;$magnitude <= $length;$magnitude+= $step_len ){
        my $label = $magnitude/1000;
        $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-2,width=>0.5,height=>1,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        if($magnitude%(5*$step_len) == 0){
            $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-3,width=>0.7,height=>3,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
            if($magnitude%(10*$step_len) == 0){
                $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-5,width=>2, height=>5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
                $svg->text(x =>50+$magnitude/$scale,y =>$yyy-5, width => 2, height => 5, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>7, "-cdata" => "$label Kb");
            }
        }
        else{
            $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-1.5,width=>0.5,height=>1.5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }

    foreach my $loc(keys %{$hashBed{$key}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        $svg->rectangle(x=>50+($start/$scale),y=>$y_loc,width=>$length/$scale,height=>10,fill=>"$hashBed{$key}{$loc}",stroke=>'none',style => {'stroke-width'   => '0.001'});
    }

    foreach my $loc(keys %{$hash_direction{$key}}){
        my ($start,$end) = split /\s+/,$loc;
        my $x1; my $y1;my $x2; my $y2;my $x3; my $y3;
        if($hash_direction{$key}{$loc} eq '+'){
            $x1 = 50+($start/$scale);$x2 = $x1;$x3 = 50+($end/$scale);$y1 = $y_loc-1;$y2 = $y_loc-5;$y3 = $y_loc-3;
        }
        else{
            $x1 = 50+($start/$scale);$x2 = 50+($end/$scale);$x3 = 50+($end/$scale);$y1 = $y_loc-3;$y2 = $y_loc-1;$y3 = $y_loc-5;
        }
        
        my $color;
        if(exists $hash_indel{$key}{"$start\t$end"}){
            $color = $hash_indel{$key}{"$start\t$end"};
        }
        else{
            print "no color\n";
        }
        my $xv = [$x1,$x2,$x3];
        my $yv = [$y1,$y2,$y3];
        my $points = $svg->get_path(    x=>$xv, y=>$yv,    -type=>'polygon');
        $svg->polygon(%$points,"fill"=>"$color");
        # $svg->polygon(x1=>$x1,y1=>$y1,x2=>$x2,y2=>$y2,x3=>$x3,y3=>$y3,style=>{"fill"=>"$color", stroke=>'none'});
    }
    
    $count += 1;
}
my $out = $svg->xmlify;
my $output = "$pseudomolecule-$theEndSeq.svg";
open SVGFILE,">$output" or die;
print SVGFILE $out;
close SVGFILE;
