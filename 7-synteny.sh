#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J read_quality_control
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
module load bioinfo-tools
module load blast
makeblastdb -in ../Genome-Analysis/input_files/lept_sequence.fasta -dbtype nucl
blastn -query ../Genome-Analysis/input_files/sequence.fasta -db ../Genome-Analysis/input_files/lept_sequence.fasta -evalue 1 -task megablast -outfmt 6 > lept1_lept2.crunch
