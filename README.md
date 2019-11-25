# dsRNAanalysis
dsRNA NGS data processing and analysis for 12 Lactic Acid Bacteria (LAB) species

QIIME 1.9, Excel, and custom Perl scripts were used for the processing and analysis.
Steps 1 to 11 are for individual species file processing
Steps 12 to 17 are to generate matrix of similar sequences

1. QIIME: extracting barcodes 
2. QIIME: fasta format conversion
2. Perl (trim_seq_multi-adapter.pl): Extract adapter  
3. Perl (remove-blank-fasta.pl): Remove IDs with blank sequences
4. QIIME: OTU pickup
5. QIIME: Representative Sequence pick up
6. Perl (count_columns.pl): Counting columns of the OTU table
7. Perl (remove_non_atgc.pl): Remove non-ATGC sequences
8. Perl (fasta_oneline_uniform.pl): Make one line fasta sequence for table generation
9. Excel: Calculate relative abundance and size/length of the sequences 
10. Excel: Mention the length and relative abundance score in the fasta description line for all sequences
11: Excel: Choose the lenghths of 18 to 51 basepair sequences for downstream processing
12. Perl (merge_files.pl): Merge all 12 fasta files
13. Perl (remove_duplicate_seqs.pl): Remove duplicate sequences
14. Perl (fasta_oneline_uniform.pl): Make one line fasta sequence for table generation
15. Excel: Prepare the merged file as well as all 12 species files for matching and create text files for each
16. Perl (find_uniq_seq_print_id.pl): Find matching unique sequence for each species with the merged file and print their IDs in a excel file
17. Excel: Make a matrix of relative abundance score belonging to each sequence

Take the final generated matrix for further analysis
