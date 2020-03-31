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
canu executiveThreads=2 -d project -p DNA_raw_assembly genomeSize=2.5m stopOnReadQuality=false -pacbio-raw zcat /proj/g2020008/nobackup/private/3_Christel_2017/ERR2028495.fastq.gz | wc -l zcat /proj/g2020008/nobackup/private/3_Christel_2017/ERR2028496.fastq.gz | wc -l zcat /proj/g2020008/nobackup/private/3_Christel_2017/ERR2028497.fastq.gz | wc -l zcat /proj/g2020008/nobackup/private/3_Christel_2017/ERR2028500.fastq.gz | wc -l zcat /proj/g2020008/nobackup/private/3_Christel_2017/ERR2028501.fastq.gz | wc -l zcat /proj/g2020008/nobackup/private/3_Christel_2017/ERR2028502.fastq.gz | wc -l
