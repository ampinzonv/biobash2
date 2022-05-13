#!/bin/bash
source lib/bb_native/file.sh

echo "[Input file]: $1"

path=$(file::full_path $1)

echo "[Full path]: $path"

#is fasta?
fasta=$(file::is_fasta $1)
echo "[Is fasta?]:  $fasta"

#is Multiple fasta?
echo "[Is multi-fasta?]: " $(file::is_multiple_fasta $1)

#is fastq?
echo "[Is fastq?]: " $(file::is_fastq $1)

#is fast5?

#is vcf?

#is bed?

# is sam?

# is bam?

exit
