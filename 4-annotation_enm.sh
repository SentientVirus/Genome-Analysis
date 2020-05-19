#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J genome_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
# Load modules
module load bioinfo-tools
module load eggNOG-mapper
download_eggnog_data.py -y --data_dir eggNOG bact
#download_eggnog_data.py -y --data_dir eggNOG bactNOG
# Your commands
emapper.py -m diamond --annotate_hits_table assembly/DNA_corrected2.fasta --no_file_comments -o enm_annotation --output eggNOGmapper --cpu 2
