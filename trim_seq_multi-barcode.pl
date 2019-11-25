#!/usr/bin/perl
#Description:Program to trim the RNAseq FASTA files by the given barcode sequence
#Input: Directory with all multifasta files 
#Output: extracted trimmed seqs and a summary table
#Note: Change the adapter seq according to need
#to run: >perl trim_seq_multi-barcode.pl
#it will ask for the folder containing fasta files, give it and hit enter
my $VERSION = "2.0 [to process a folder of Multi-Fasta files], all barcodes";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "Mar/2017";
#Barcodes
#1)	THa CACATCACGATC
#2)	LPz  CACCGATGTATC
#3)	LPt  CACTTAGGCATC
#4)	LSp CACTGACCAATC
#5)	LBr  CACACAGTGATC
#6)	PPe  CACGCCAATATC
#7)	LCi  CACCAGATCATC
#8)	LLa  CACACTTGAATC
#9)	WCb	CACGATCAGATC
#10)	LAt  CACTAGCTTATC
#11)	BSt   CACGGCTACATC
#12)	SCv  CACCTTGTAATC
###############################################START###################################RAJ################
print "\nEnter Folder Name Containing FASTA Sequence Files:";
$dir=<>;
chomp($dir);
opendir(DIR, $dir)or die "Cannot open $dir: $!";
@FILES=readdir(DIR);
closedir(DIR);
shift(@FILES);
shift(@FILES);
$no_file=(@FILES);

print "\n********************************START********************************\n";
#open(file4,">seq_count.tab");
#print file4 "File_Name\tNo.ofSeqs_trimmed\tNo.Seqs_Not_trimmed\n";
foreach $file(@FILES)
# Open each FASTA file #
{
  open (FASTA,"<$dir\\$file") || die ("\nError: FASTA file doesn't exist !\n\n");
  open(OUT,">$file.trimmed.fasta"); # open output file for each fasta file
  #open(file4,">>seq_count.tab");
  print"\nProcessing File:: $file\n";
  #print file4 "$file";
  my $dna = "";
  $r = 0;
  $r2 = 0;
  while(<FASTA>) {
    chomp($_);
    if ($_ =~  m/^>/ ) {
      if ($dna =~ /^(.*?)CACGGCTACATC(.*?)/i) { # cheking the adapter match with fasta seq 
        $r = $r + 1;
        print OUT "$header\n"; #only the fasta desc of the matched seq will be printed
        print OUT "\n"; # will print only the seq not the adapter ($& will print both the adapter and the sequence)
        #print ($dna =~ m/.*ZZ[ATGC]ZZ(.*?)XX[atgc]XX.*/i);
      } else {
         $r2 = $r2 + 1;
        print OUT "$header\n"; #only the fasta desc of the un-matched seq will be printed
        print OUT "$dna\n"; # will print the unmateched seq 
        #print ($dna =~ m/.*ZZ[ATGC]ZZ(.*?)XX[atgc]XX.*/i);
      } 
    $dna = ""; # Resetting the sequence holder
    $header = $_; # getting the fasta desc line
    }
    else {
        $dna .= $_; # if it is not a fasta desc line, add to your dna sequence.
    }
  }
  # Checking the last sequence
  if ($dna =~ /^(.*?)CACGGCTACATC(.*?)/i) {
      #print "test print dna-last-----\n$dna\n";
      print OUT "$header\n"; #only the fasta desc of the matched adapter will be printed
      print OUT "deleted\n"; # will print only the seq not the adapter ($& will print both the adapter and the sequence)
    } else { 
        print OUT "$header\n"; #only the fasta desc of the un-matched adapter will be printed
        print OUT "$dna\n"; # will print only the unmatched seq 
        #print ($dna =~ m/.*ZZ[ATGC]ZZ(.*?)XX[atgc]XX.*/i);
      } 
  $r1 = $r;
  $r3 = $r2;
  print "Number of sequences trimmed: $r1\n";
  #print file4 "\t$r1\n";
  print "Number of sequences not-trimmed: $r3\n";
  #print file4 "\n$file\t$r1\t$r3";
}
print "\n*********************************END**********************************\n";
print "\nTotal Number of Files Processed: $no_file\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";
