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
canu maxThreads=2 -d project -p DNA_raw_assembly genomeSize=2.5m stopOnReadQuality=false -pacbio-raw 3_Christel_2017/DNA_raw_data/*
