#!/usr/bin/perl
#Description: To count the number of columns in a tab delimeted file
#Input: tab delimeted file name 
#Output: count
#Usage:: >perl count_columns.pl infile > outfile
my $VERSION = "1.0 [tab delimeted file]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "Aug/2017";
###############################################START###################################RAJ###############
use strict;

my $input_file=$ARGV[0];
open(IN,"<$input_file") || die ("Error opening $input_file $!");

my @lines=<IN>;

my $line;
my $count;
#print "$line";
foreach $line(@lines)
{
    chomp $line;
    if($line =~ m/^denovo/)#count starts with identifying row name
        {
            my @col = split(/\t/, $line);
            $col[0]=~s/\n+/\n/g;
            #$col[1]=~s/\n+/\n/g;
            $count = scalar(@col) - 1;
            print "$col[0]\t$count\n";
            #print file3 "$id1\tf__$id11\n";
        }
}
print "\n*********************************END**********************************\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";
