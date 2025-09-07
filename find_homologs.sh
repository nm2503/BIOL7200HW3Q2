#!/bin/bash

queryFile=$1
subjectFile=$2
output=$3

tblastn -query "$queryFile" -subject "$subjectFile" -outfmt '6 qseqid sseqid pident length qlen' \ | awk '$3 > 30 && $4 > 0.9 * $5' > "$output"

