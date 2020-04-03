#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J assembly_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
# Load modules
module load bioinfo-tools
module load quast
# Your commands
python quast_libs.py -o project -R /proj/g2020008/3_Christel_2017/reference/OBMB01.fasta --gene-finding -t 2 /assembly/DNA_raw_assembly.contigs.fasta
