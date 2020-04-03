#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:31:00
#SBATCH -J reads_preprocessing
#SBATCH --mail-type=ALL
#SBATCH --mail-user Marina.Motamerlo.2433@student.uu.se
# Load modules
module load bioinfo-tools
module load trimmomatic
# Your commands
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2036629_1.fastq.gz  ERR2036629_2.fastq.gz ERR2036629_P1.trim.fastq.gz ERR2036629_S1.trim.fastq.gz ERR2036629_P2.trim.fastq.gz ERR2036629_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2036630_1.fastq.gz  ERR2036630_2.fastq.gz ERR2036630_P1.trim.fastq.gz ERR2036630_S1.trim.fastq.gz ERR2036630_P2.trim.fastq.gz ERR2036630_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2036631_1.fastq.gz  ERR2036631_2.fastq.gz ERR2036631_P1.trim.fastq.gz ERR2036631_S1.trim.fastq.gz ERR2036631_P2.trim.fastq.gz ERR2036631_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2036632_1.fastq.gz  ERR2036632_2.fastq.gz ERR2036632_P1.trim.fastq.gz ERR2036632_S1.trim.fastq.gz ERR2036632_P2.trim.fastq.gz ERR2036632_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2036633_1.fastq.gz  ERR2036633_2.fastq.gz ERR2036633_P1.trim.fastq.gz ERR2036633_S1.trim.fastq.gz ERR2036633_P2.trim.fastq.gz ERR2036633_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2117288_1.fastq.gz  ERR2117288_2.fastq.gz ERR2117288_P1.trim.fastq.gz ERR2117288_S1.trim.fastq.gz ERR2117288_P2.trim.fastq.gz ERR2117288_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2117289_1.fastq.gz  ERR2117289_2.fastq.gz ERR2117289_P1.trim.fastq.gz ERR2117289_S1.trim.fastq.gz ERR2117289_P2.trim.fastq.gz ERR2117289_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2117290_1.fastq.gz  ERR2117290_2.fastq.gz ERR2117290_P1.trim.fastq.gz ERR2117290_S1.trim.fastq.gz ERR2117290_P2.trim.fastq.gz ERR2117290_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2117291_1.fastq.gz  ERR2117291_2.fastq.gz ERR2117291_P1.trim.fastq.gz ERR2117291_S1.trim.fastq.gz ERR2117291_P2.trim.fastq.gz ERR2117291_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar -threads 2 PE ERR2117292_1.fastq.gz  ERR2117292_2.fastq.gz ERR2117292_P1.trim.fastq.gz ERR2117292_S1.trim.fastq.gz ERR2117292_P2.trim.fastq.gz ERR2117292_S2.trim.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
