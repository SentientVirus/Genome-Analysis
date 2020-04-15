#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J genome_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
# Load modules
module load bioinfo-tools
module load prokka
# Your commands
prokka assembly/DNA_raw_assembly.contigs.fasta --outdir prokka --prefix DNA_annotated --force --addgenes --genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg --usegenus --proteins Leptospirillum
