#!/usr/bin/perl

my @bs;

open(FIL,"surv.HGGs.dat") || die("Cannot Open File");
while(<FIL>)
{
  chomp;
  next unless ($_=~/BS/);
  my ($bs, $time, $event) = split;
  push @bs, $bs;

}
while(<>)
{
  chomp;
  my ($id, $ijc, $sjc) = split "\t";
  my @ijcs = split/\,/,$ijc;
  my @sjcs = split/\,/,$sjc;
  my $i = 0;
  while($i < $#ijcs+1)
  {
    if( ($ijcs[$i]-$sjcs[$i] >= 10) )
    {
    #print $ijcs[$i],"/";
    #print $sjcs[$i],"\t";
      print $ijcs[$i]-$sjcs[$i];
      print "\tHigh\t";
      print $bs[$i],"\n";
    }
    if ($ijcs[$i]-$sjcs[$i] <= -10)
    {
      print $ijcs[$i]-$sjcs[$i];
      print "\tLow\t";
      print $bs[$i],"\n";
    }

    $i++;

  }
}

__DATA__
MCAM_chr11:119310348-119310466_119308528-119309915_119310755-119310903	0,0,475,323,0,764,0,0,1617,386,0,0,0,0,0,813,0,0,762,0,0,486,1249,2660,431,1373,1048,565,777,0,0,0,0,0,0,423,0,795,0,752,0,684,0,1098,0,841,911,919,364,351,796,0,1004,279,1035,0,0,610,0,0,0,479,174,377,482,0	0,0,0,18,17,0,15,0,0,36,18,0,0,0,0,0,23,0,0,37,0,25,10,17,0,13,47,119,17,0,41,38,14,23,0,0,0,0,0,0,0,31,11,0,22,0,60,0,0,0,30,0,28,0,33,46,61,19,15,20,39,0,41,21,24,19,0,0,23,15,0,0,0,11,54,28,19,0	267	149	0.0003997029209688814