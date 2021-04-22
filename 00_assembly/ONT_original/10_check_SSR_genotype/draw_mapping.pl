#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($pseudomolecule,$karyotypes,$bed,$coor) = @ARGV;


my %hash_scaffolds;
open NEW,"$pseudomolecule" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    $hash_scaffolds{"$array[0]\t$array[1]\t$array[2]"} = $array[2] - $array[1]+1;
}
close NEW;

my %hash_karyotypes;
open NEW,"$karyotypes" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	# $array[4] = $array[4]-1;
    $hash_karyotypes{"$array[0]\t$array[1]\t$array[2]\t$array[3]\t$array[4]\t$array[5]"} = abs($array[5] - $array[4]);
}
close NEW;

# bedtools intersect提取我们要画的区域的颜色
system("bedtools intersect -a $bed -b $pseudomolecule > $bed.$pseudomolecule.region");
my %hashBed;
open NEW, "$bed" or die;
while(<NEW>){
    chomp;
    my @array = split /\s+/;
    $hashBed{$array[0]}{"$array[1]\t$array[2]"} = $array[3];
}
close NEW;
system("rm $bed.$pseudomolecule.region");


my %hashCorr;
open NEW, "$coor" or die;
while(<NEW>){
    chomp;
    my ($read1,$read2,$read1start,$read1end,$read2start,$read2end) = split /\s+/,$_;
    push @{$hashCorr{"$read1\t$read2"}},"$read1start\t$read1end\t$read2start\t$read2end";
}
close NEW;

my $scale;
## draw the bar chart of ref_genome chromosomes
my $add_y = 100;
my $svg;


my $count = 0;
my $theEndSeq;
foreach my $key(sort {$hash_karyotypes{$b} <=> $hash_karyotypes{$a} }keys %hash_karyotypes){
    my ($old_read,$old_regionStart,$old_regionEnd,$newread,$regionStart,$regionEnd) = split /\s+/,$key;
    my ($read1,$read2) = ($old_read,$newread);
    my ($startread1,$endread1,$startread2,$endread2) = ($old_regionStart,$old_regionEnd,$regionStart,$regionEnd);
    my ($read,$length) = ($read1,$hash_scaffolds{"$read1\t$old_regionStart\t$old_regionEnd"});
    # my $length = $hash_scaffolds{$key};
    
    my $countInPicture = $count % 100;
    my $thePictureSeq = int($count/100);
    $theEndSeq = $thePictureSeq + 1;
    if($countInPicture == 0){
        if($thePictureSeq >= 1){
            my $out = $svg->xmlify;
            my $output = "$coor-$thePictureSeq.svg";
            open SVGFILE,">$output" or die;
            print SVGFILE $out;
            close SVGFILE;
            system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $pseudomolecule-$thePictureSeq.pdf");
	    system("rm $pseudomolecule-$thePictureSeq.svg");
        }
        $svg = SVG->new(width=>2500, height=>100*100 + 100);
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
    $svg->text(x =>350 + $length/$scale,y =>$y_loc+7, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>10, "-cdata" => "$read $old_regionStart $old_regionEnd:$length bp");
    my $yyy = $y_loc;
    $svg->rectangle(x=>50,y=>$yyy,width=>$length/$scale,height=>1,fill=>'black',stroke=>'none');
    my $labelStart = $step_len * (int($old_regionStart/$step_len)+1);
    for(my $magnitude = $labelStart;$magnitude <= $old_regionStart + $length;$magnitude+= $step_len ){
        my $label = $magnitude/1000;
        # $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-2,width=>0.5,height=>1,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        if($magnitude%(5*$step_len) == 0){
            if($magnitude%(10*$step_len) == 0){
                $svg->rectangle(x=>50+($magnitude - $old_regionStart)/$scale,y=>$yyy-5,width=>2, height=>5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
                $svg->text(x =>50+($magnitude - $old_regionStart)/$scale,y =>$yyy-5, width => 2, height => 5, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>7, "-cdata" => "$label Kb");
                next;
            }
            $svg->rectangle(x=>50+($magnitude - $old_regionStart)/$scale,y=>$yyy-3,width=>0.7,height=>3,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
        else{
            $svg->rectangle(x=>50+($magnitude - $old_regionStart)/$scale,y=>$yyy-1.5,width=>0.5,height=>1.5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }

    foreach my $loc(keys %{$hashBed{$read}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        # if($start >= $old_regionStart and $end <= $old_regionEnd){
        if($start <= $old_regionEnd and $end >= $old_regionStart){
			my @ss = ($start,$old_regionStart); @ss = sort {$b <=> $a} @ss;
			my @ee = ($end,$old_regionEnd); @ee = sort {$a <=> $b} @ee;
			my ($draw_s,$draw_e) = ($ss[0],$ee[0]);
		    $svg->rectangle(x=>50+($draw_s-$old_regionStart)/$scale,y=>$y_loc+1,width=>($draw_e - $draw_s)/$scale,height=>9,fill=>"$hashBed{$read}{$loc}",stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }

    ###############################################################################################################################################################

    ################################################################################################################################################################

    #draw read2
	# print "$read2\t$regionStart\t$regionEnd\n";
    ($read,$length) = ($read2,$hash_scaffolds{"$read2\t$regionStart\t$regionEnd"});


    $svg->rectangle(x=>50,y=>$y_loc + 70 ,width=>$length/$scale,height=>10,fill=>'grey',stroke=>'none',style => {'stroke-width'   => '0.001'});
    $svg->text(x =>350 + $length/$scale,y =>$y_loc + 70 +7, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>10, "-cdata" => "$read:$length bp");
    $yyy = $y_loc + 70 ;
    $svg->rectangle(x=>50,y=>$yyy,width=>$length/$scale,height=>1,fill=>'black',stroke=>'none');
    $labelStart = $step_len * (int($regionStart/$step_len)+1);
    for(my $magnitude = $labelStart;$magnitude <= $regionStart + $length;$magnitude+= $step_len ){
        my $label = $magnitude/1000;
        # $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-2,width=>0.5,height=>1,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
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

    foreach my $loc(keys %{$hashBed{$read}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        # if($start >= $regionStart and $end <= $regionEnd){
        if($start <= $regionEnd and $end >= $regionStart){
			my @ss = ($start,$regionStart); @ss = sort {$b <=> $a} @ss;
			my @ee = ($end,$regionEnd); @ee = sort {$a <=> $b} @ee;
			my ($draw_s,$draw_e) = ($ss[0],$ee[0]);
			$svg->rectangle(x=>50+($draw_s-$regionStart)/$scale,y=>$y_loc + 1 + 70 ,width=>($draw_e-$draw_s)/$scale,height=>9,fill=>"$hashBed{$read}{$loc}",stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }

   


    #draw coor
    foreach my $correlation (@{$hashCorr{"$read1\t$read2"}}){
        my ($startread1,$endread1,$startread2,$endread2) = split /\s+/,$correlation;
        my $coor_x1; my $coor_y1;my $coor_x2; my $coor_y2;my $coor_x3; my $coor_y3;my $coor_x4; my $coor_y4;
        $coor_x1 = 50+($startread1- $old_regionStart)/$scale;$coor_x2 = 50+($endread1- $old_regionStart)/$scale;$coor_x3 = 50+($endread2-$regionStart)/$scale;$coor_x4 = 50+($startread2-$regionStart)/$scale;
        $coor_y1 = $y_loc+10;$coor_y2 = $y_loc+10;$coor_y3 = $y_loc+70-10;$coor_y4 = $y_loc+70-10;
        my $coor_xv = [$coor_x1,$coor_x2,$coor_x3,$coor_x4];
        my $coor_yv = [$coor_y1,$coor_y2,$coor_y3,$coor_y4];
        my $coor_points = $svg->get_path(    x=>$coor_xv, y=>$coor_yv,    -type=>'polygon');
        $svg->polygon(%$coor_points,"fill"=>"grey");
    }


    $count += 1;
}
my $out = $svg->xmlify;
my $output = "$coor-$theEndSeq.svg";
open SVGFILE,">$output" or die;
print SVGFILE $out;
close SVGFILE;
system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $pseudomolecule-$theEndSeq.pdf");
system("rm $coor-$theEndSeq.svg");
