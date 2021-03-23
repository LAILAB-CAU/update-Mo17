#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($pseudomolecule,$bed,$forward,$backward,$indel,$coor) = @ARGV;

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


my @list_coor;
open NEW, "$coor" or die;
while(<NEW>){
    chomp;
    push @list_coor, $_;
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
foreach my $key(@list_coor){

    my ($read1,$read2,$startread1,$endread1,$startread2,$endread2) = split /\s+/,$key;
    my ($readID,$read,$length) = ((split /:/,$read1)[0],(split /:/,$read1)[1],$hash_scaffolds{(split /:/,$read1)[1]});
    # my $length = $hash_scaffolds{$key};
    
    my $countInPicture = $count % 25;
    my $thePictureSeq = int($count/25);
    $theEndSeq = $thePictureSeq + 1;
    if($countInPicture == 0){
        if($thePictureSeq >= 1){
            my $out = $svg->xmlify;
            my $output = "$coor-$thePictureSeq.svg";
            open SVGFILE,">$output" or die;
            print SVGFILE $out;
            close SVGFILE;
            system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $coor-$thePictureSeq.pdf");
        }
        $svg = SVG->new(width=>1000, height=>25*100 + 100);
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
    

    
    my $y_loc = $add_y + 100 * $countInPicture;
    
    #draw read1
    
    $svg->rectangle(x=>50,y=>$y_loc,width=>$length/$scale,height=>10,fill=>'grey',stroke=>'none',style => {'stroke-width'   => '0.001'});
    $svg->text(x =>370 + $length/$scale,y =>$y_loc+7, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>10, "-cdata" => "$readID:$read:$length bp");
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

    foreach my $loc(keys %{$hashBed{$read}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        $svg->rectangle(x=>50+($start/$scale),y=>$y_loc,width=>$length/$scale,height=>10,fill=>"$hashBed{$read}{$loc}",stroke=>'none',style => {'stroke-width'   => '0.001'});
    }

    foreach my $loc(keys %{$hash_direction{$read}}){
        my ($start,$end) = split /\s+/,$loc;
        my $x1; my $y1;my $x2; my $y2;my $x3; my $y3;
        if($hash_direction{$read}{$loc} eq '+'){
            $x1 = 50+($start/$scale);$x2 = $x1;$x3 = 50+($end/$scale);$y1 = $y_loc-1;$y2 = $y_loc-5;$y3 = $y_loc-3;
        }
        else{
            $x1 = 50+($start/$scale);$x2 = 50+($end/$scale);$x3 = 50+($end/$scale);$y1 = $y_loc-3;$y2 = $y_loc-1;$y3 = $y_loc-5;
        }
        
        my $color;
        if(exists $hash_indel{$read}{"$start\t$end"}){
            $color = $hash_indel{$read}{"$start\t$end"};
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
    

    #draw read2
    ($readID,$read,$length) = ((split /:/,$read2)[0],(split /:/,$read2)[1],$hash_scaffolds{(split /:/,$read2)[1]});
    # ($read,$length) = ($read2,$hash_scaffolds{$read2});
    $svg->rectangle(x=>50,y=>$y_loc + 70,width=>$length/$scale,height=>10,fill=>'grey',stroke=>'none',style => {'stroke-width'   => '0.001'});
    $svg->text(x =>370 + $length/$scale,y =>$y_loc + 70+7, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>10, "-cdata" => "$readID:$read:$length bp");
    $yyy = $y_loc + 70;
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

    foreach my $loc(keys %{$hashBed{$read}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        $svg->rectangle(x=>50+($start/$scale),y=>$y_loc + 70,width=>$length/$scale,height=>10,fill=>"$hashBed{$read}{$loc}",stroke=>'none',style => {'stroke-width'   => '0.001'});
    }

    foreach my $loc(keys %{$hash_direction{$read}}){
        my ($start,$end) = split /\s+/,$loc;
        my $x1; my $y1;my $x2; my $y2;my $x3; my $y3;
        if($hash_direction{$read}{$loc} eq '+'){
            $x1 = 50+($start/$scale);$x2 = $x1;$x3 = 50+($end/$scale);$y1 = $y_loc + 70-1;$y2 = $y_loc + 70-5;$y3 = $y_loc + 70-3;
        }
        else{
            $x1 = 50+($start/$scale);$x2 = 50+($end/$scale);$x3 = 50+($end/$scale);$y1 = $y_loc + 70-3;$y2 = $y_loc + 70-1;$y3 = $y_loc + 70-5;
        }
        
        my $color;
        if(exists $hash_indel{$read}{"$start\t$end"}){
            $color = $hash_indel{$read}{"$start\t$end"};
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


    #draw coor
    my $coor_x1; my $coor_y1;my $coor_x2; my $coor_y2;my $coor_x3; my $coor_y3;my $coor_x4; my $coor_y4;
    $coor_x1 = 50+($startread1/$scale);$coor_x2 = 50+($endread1/$scale);$coor_x3 = 50+($endread2/$scale);$coor_x4 = 50+($startread2/$scale);
    $coor_y1 = $y_loc+10;$coor_y2 = $y_loc+10;$coor_y3 = $y_loc+70-10;$coor_y4 = $y_loc+70-10;
    my $coor_xv = [$coor_x1,$coor_x2,$coor_x3,$coor_x4];
    my $coor_yv = [$coor_y1,$coor_y2,$coor_y3,$coor_y4];
    my $coor_points = $svg->get_path(    x=>$coor_xv, y=>$coor_yv,    -type=>'polygon');
    $svg->polygon(%$coor_points,"fill"=>"grey");


    $count += 1;
}
my $out = $svg->xmlify;
my $output = "$coor-$theEndSeq.svg";
open SVGFILE,">$output" or die;
print SVGFILE $out;
close SVGFILE;
system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $coor-$theEndSeq.pdf");