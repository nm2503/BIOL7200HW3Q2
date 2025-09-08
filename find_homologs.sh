#!/bin/bash 

queryFile=$1 
subjectFile=$2 
output=$3 

tblastn -query $queryFile -subject $subjectFile -task tblastn -outfmt "6 qseqid sseqid pident length qlen" -out allMatches.txt

awk '$3 > 30 && $4 > 0.9 * $5' allMatches.txt > "$output" 

filterMatches=$(wc -l < "$output") 
echo "$filterMatches"