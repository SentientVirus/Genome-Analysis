#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J read_quality_control
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se

module load bioinfo-tools
module load FastQC
fastqc 3_Christel_2017/RNA_raw/ERR20* fastqc/* -t 2
