#!/usr/bin/perl
#to run: >perl remove-blank-fasta.pl input.fasta > output.fasta
#desc: removing blank sequences (contains only IDs not sequences)
my $VERSION = "1.1 [blanks fasta]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "Feb/2015";
###############################################START###################################RAJ################
use strict;
use warnings;
#print "\n********************************START********************************\n";
$/="\n>";
while (<>) {
  s/>//g;
  my ($id, $seq) = split (/\n/, $_);
  print ">$_" if ((length $seq) > 1);
}
print "\n*********************************END**********************************\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n";
