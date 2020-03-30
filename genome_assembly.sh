#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 14:00:00
#SBATCH -J genome_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
# Load modules
module load bioinfo-tools
module load canu
# Your commands
canu -num_threads 2 -d Genome-Analysis -p DNA_raw_assembly genomeSize=2.5m stopOnReadQuality=false -pacbio-raw DNA_raw_data
