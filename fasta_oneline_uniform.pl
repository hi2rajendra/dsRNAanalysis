#!/usr/bin/perl
#Description:
#To make uniform fasta file: \n description line + ;base; +sequence. (single line sequence with description for programmatic use)
#Usage:: >perl fasta_oneline_uniform.pl infile.fasta > outfile_uniform.fasta
my $VERSION = "1.0 [prepares fasta file for further analysis]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "April/2014";
###############################################START###################################RAJ################
use strict;

my $input_fasta=$ARGV[0];
open(IN,"<$input_fasta") || die ("Error opening $input_fasta $!");
my $line; 
#print "$line";
while ($line = <IN>)
{
chomp $line;
if ($line=~m/^>/gi) {
    #$line=~s/\tLineage=/;Lineage=/g;
    #$line=~s/\s/_/g;
    print "\n",$line,";base;"; } #depending upon your future requirements change it
else { print $line; }
}
print "\n";
print "\n*********************************END**********************************\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";