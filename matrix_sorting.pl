#!/usr/bin/perl
#Description:Program to extract both the lines containing the given string and without the string and create separate files. (cut and paste kind)
#to find RAs in 
#1. present in one species (new file 1 will be created)
#2. present in all species (new file 2 will be created)
#3. rest of the hits (parent file will be modified if given the same name) 
#Note: Change the required string in the script
#to run: >perl matrix_sorting.pl then enter,
my $VERSION = "2.0 [matrix match]";
my $AUTHOR = "Rajendra K. Labala"; my $DATE1 = "July/2017";
###############################################START###################################RAJ################
use strict; 
use warnings; 

print "\n********************************START********************************\n";

open( FILE, "<Match_Matrix_RA_only_re-sorting.txt" ); #opening the parent file
my @LINES = <FILE>; 
close( FILE ); 
open (NEW, ">", "Match_Matrix_RA_only_re-sorting_hits_only_in_one_species.txt" ) or die "could not open:$!"; #creating new file containing the string
open( FILE, ">Match_Matrix_RA_only_re-sorting.txt" ) or die "could not open:$!"; #give a new name if you want to
    #cteate a new file containing the rest of the lines, OR give the same parent file name to delete inside it
foreach my $LINE ( @LINES ) {
        print NEW $LINE if ($LINE =~ m/;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*/); 
        print FILE $LINE unless ( $LINE =~ m/;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*;NA/ ||
                            $LINE =~ m/NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;NA;[0-9]*.[0-9]*/);  #printing new file without the string
    } 
   
    close( NEW );
    close( FILE );
    print( "\nsuccessfully created files 'with' and 'without' the string\n" );
    
    
    open( FILE2, "<Match_Matrix_RA_only_re-sorting.txt" ); #opening the parent file
    my @LINES2 = <FILE2>; 
    close( FILE2 ); 
    
    open (NEW2, ">", "Match_Matrix_RA_only_re-sorting_hits_in_all_species.txt" ) or die "could not open:$!"; #creating new file containing the string
    open( FILE2, ">Match_Matrix_RA_only_re-sorting.txt" ) or die "could not open:$!"; #give a new name if you want to
    #cteate a new file containing the rest of the lines, OR give the same parent file name to delete inside it
        
    foreach my $LINE2 ( @LINES2 ) {
        print NEW2 $LINE2 if ($LINE2 =~ m/;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*/); 
        print FILE2 $LINE2 unless ( $LINE2 =~ m/;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*;[0-9]*.[0-9]*/);  
        #printing new file without the string
    } 
    close( NEW2 );
    close( FILE2 );
    print( "\nsuccessfully created files 'with' and 'without' the string\n" ); 

print "\n*********************************END*********************************\n";
print "\nScript Details\n===============\nAuthor: $AUTHOR\nVersion: $VERSION\nDate Created: $DATE1\n\n";