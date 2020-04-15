#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 13:00:00
#SBATCH -J alignment_and_dif_expression
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
# Load modules
module load bioinfo-tools
module load bwa
module load samtools
module load htseq
# Your commands
bwa index assembly/DNA_raw_assembly.contigs.fasta
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2036629_P1.trim.fastq.gz trimmomatic/ERR2036629_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2036629.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2036630_P1.trim.fastq.gz trimmomatic/ERR2036630_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2036630.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2036631_P1.trim.fastq.gz trimmomatic/ERR2036631_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2036631.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2036632_P1.trim.fastq.gz trimmomatic/ERR2036632_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2036632.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2036633_P1.trim.fastq.gz trimmomatic/ERR2036633_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2036633.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2117288_P1.trim.fastq.gz trimmomatic/ERR2117288_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2117288.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2117289_P1.trim.fastq.gz trimmomatic/ERR2117289_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2117289.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2117290_P1.trim.fastq.gz trimmomatic/ERR2117290_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2117290.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2117291_P1.trim.fastq.gz trimmomatic/ERR2117291_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2117291.txt
bwa mem -t 4 assembly/DNA_raw_assembly.contigs.fasta trimmomatic/ERR2117292_P1.trim.fastq.gz trimmomatic/ERR2117292_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - prokka/lept.gff > ERR2117292.txt
