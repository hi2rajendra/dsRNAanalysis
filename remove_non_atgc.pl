#!/usr/bin/perl
#Requirement: BioPerl
#Description: To remove the sequences containing non-ATGC characters in a fasta file
#run: >perl remove_non_atgc.pl file.fas > file_cleaned.fas
my $VERSION = "1.2 [non-ATGC fasta]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "Jan/2015";
###############################################START###################################RAJ################
use strict;
use warnings;
use Bio::SeqIO;
my $in = Bio::SeqIO->new( -file => shift, -format => 'Fasta' );
while ( my $seq = $in->next_seq() ) {
    print '>' . $seq->id . ' ' . $seq->desc . "\n" . $seq->seq . "\n"
      if $seq->seq !~ /[qweryiopsdfhjklzxvbnm1234567890]/i;
}
print "\n*********************************END**********************************\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";
