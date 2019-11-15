#!/usr/bin/perl
#Description:
#To match and find each unique sequences of a merged file in a small dsRNA sequence file
#sample format of files:
#merged unique sequences (e.g. swapped id and sequence "all_merged_unique.txt"): sample
#>CGTTCCTTCGGGTTC;base;UNIQ000001
#>TTGTAATAAGTGTATGTCCAGT;base;UNIQ000002
#>GTCCTTTTTCTGATGCTGTCT;base;UNIQ000003
#>GGTTCGACTCCTCTC;base;UNIQ000004
#>TTGTCGATACT;base;UNIQ000005
##############
#small dsRNA file (e.g. swapped id and sequence "BSt.txt"): sample
#>CGTTCCTTCGGGTTC;base;denovo69383_9.159091117_15_BSt
#>TTGTAATAAGTGTATGTCCAGT;base;denovo2918_8.416329847_22_BSt
#>GTCCTTTTTCTGATGCTGTCT;base;denovo67593_7.851291786_21_BSt
#>GGTTCGACTCCTCTC;base;denovo65633_6.240642875_15_BSt
#>TTGTCGATACT;base;denovo784_2.317483595_11_BSt
###############
#run: >perl find_uniq_seq_print_id.pl
my $VERSION = "6.3 [modified from match_seq]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "July/2017";
###############################################START###################################RAJ################
$datestring1 = localtime();
my $VERSION = "1.0"; my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "21/Feb/2018";

print "Enter name of file containing merged unique sequences (e.g. all_merged_unique.txt):";
chomp($idf=<>);
open(file1,"$idf") || die "could not open file $idf\n";
@ids=<file1>;
close(file1);

print "Enter name of small dsRNA file (e.g. BSt.txt):";
chomp($seqf=<>);
open(file2,"$seqf") || die "could not open file $seqf\n";
@seqs=<file2>;
close(file2);

$seq_line=(@seqs);
#print "$seq_line";
$r = 0;
print "Enter the result file name(eg. BSt_result.txt):";
chomp($outf=<>);
open(file3,">$outf");
print file3 "Merged_UNIQ_ID\tMerged_UNIQ_ID-main\tdsRNA_File_ID\tMerged_Unique_File_Seq\tdsRNA_File_Seq\n";
foreach $id(@ids)
    {
        $id=~s/\n//g;
        if($id=~m/^>[ATGC]*;/)#change this reg ex according to your fasta file ids
        {
        print "\nOriginal: $id\n";
        	$split_id = $id;
            @sid = split(/;base;/, $split_id);#to get the ID only for matching
            $sid[0]=~s/\n+/\n/g;
            $id1 = $sid[0];
            $sid[1]=~s/\n+/\n/g;
            $id2 = $sid[1];
            print "\nID: $id1";
            print "\nUNIQ_ID: $id2";
            print file3 "\n$id2\t";

           for($i=0;$i<$seq_line;$i++)
            {
                $seq="";
                $seqs[$i]=~s/\n//g;
                if($seqs[$i]=~m/^$id1\b/) #IMP: '\b' match the whole id, or else it might match first few characters also
                {
                    print "\nmatch found: $seqs[$i]\n";
                    $seq=$seq.$seqs[$i];
                    @get_id = split(/;base;/, $seq);#to get the ID only for printing
                    $get_id[1]=~s/\n+/\n/g;
                    $r++;
                    print file3 "$id2\t$get_id[1]\t$id1\t$seq";
                    print "0-$r\n";
                    last;
                }#else{print file3 "else--------------$id2\t$seq\n";}
            }
        }
    }
close(file3);
#print `seq_id.txt`;
print "\n\n*********************************END**********************************\n";
print "\nTotal Number of sequences extracted: $r\n";
print "\nResulted File $outf is saved to the directory\n";
$datestring2 = localtime();    
print "Program started at: $datestring1\n";
print "Program finished at: $datestring2\n\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";