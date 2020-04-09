#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
# Load modules
module load bioinfo-tools
module load bwa
# Your commands
bwa index -p DNA_alignment /proj/g2020008/3_Christel_2017/reference/OBMB01.fasta
bwa mem -t 2 /proj/g2020008/3_Christel_2017/reference/OBMB01.fasta assembly/DNA_raw_assembly.contigs.fasta > alignment.sam
