#!/usr/bin/perl
#Description:
#To merge multiple files
#Usage: >perl merge_files.pl in_file1.fasta in_file2.txt in_file3.txt... out_merged_file.fasta 
#any file type can be merged (eg: fasta, txt etc), last name will be output file name
my $VERSION = "1.0 [merging]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "May/2017";
###############################################START###################################RAJ################
use strict;
use warnings;

my $out_file = pop @ARGV; #last element of an array 
my @in_files = @ARGV;

die "Usage: $0 in_file1 in_file2 in_file3 in_file4 ... out_merged_file \n        (last name will be output file name) \n" if not @in_files;

open my $out, '>>', $out_file or die "Could not open '$out_file' for appending\n"; 
foreach my $file (@in_files) {
    if (open my $in, '<', $file) {
     while (my $line = <$in>) {
            print $out $line;
          }
        close $in;
    } else {
        warn "Could not open '$file' for reading\n";
    }
}
close $out;
 
print "\nMerging done and saved to: $out_file\n";
print "\n*********************************END**********************************\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";