#!/usr/bin/perl
#Requirement: BioPerl
#run: perl remove_duplicate_seqs.pl input.fasta
#Description:
#To remove duplicate sequences from a multifasta file
#This will write out 2 files
#1) New FASTA file, "input_seq_name.unique.fasta", with only unique sequences (but no record of the other IDs with that sequence)
#2) New FASTA file, "input_seq_name.duplicate.fasta", with only duplicated sequences
my $VERSION = "1.1 [creates two new files and edits the original]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "Jan/2017";
###############################################START###################################RAJ################
use strict;
use Bio::SeqIO;
my %unique;

my $file=$ARGV[0];

my $seqin  = Bio::SeqIO->new(-file => $file, -format => "fasta");
my $seqout = Bio::SeqIO->new(-file => ">$file.duplicate.fasta", -format => "fasta");
my $seqout2 = Bio::SeqIO->new(-file => ">$file.unique.fasta", -format => "fasta");

print "Sequence IDs:\n";

while(my $seqs = $seqin->next_seq) {
  my $id  = $seqs->display_id;
  print "$id\n";
  my $seq = $seqs->seq;
  if(exists($unique{$seq})) {
    $seqout->write_seq($seqs);
    $unique{$seq} +=1;
  }
  else {
    $seqout2->write_seq($seqs);
    $unique{$seq} +=1;
    }
}
print "\nDone and saved to the current directory\n";
print "\n*********************************END**********************************\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";