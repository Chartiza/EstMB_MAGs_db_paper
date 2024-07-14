#!/bin/bash
#SBATCH -J getAbud
#SBATCH --partition=amd
#SBATCH -t 190:00:00
#SBATCH --error=coverM_err2
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=120G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

module load miniconda3
source activate coverm-singlem-lorikeet

#NAME='V5M6T7'
NAME=$1

R1="/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Cleaned_reads/unique_smpls_set/bgi_${NAME}_nohost.fq1.gz"
R2="/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Cleaned_reads/unique_smpls_set/bgi_${NAME}_nohost.fq2.gz"
ref="/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Representative_MAGs_HQcl/"
PWD=$(pwd)

echo $NAME
echo 'START: '$(date)
mkdir -p $PWD/abud_results
#mkdir -p $PWD/bam
#mkdir -p $PWD/lorikeet_results

coverm genome --coupled $R1 $R2 --genome-fasta-directory $ref -x fa -o ${PWD}/abud_results/abud_${NAME}.tsv --threads 24
#lorikeet call -r $ref/*.fa -b $PWD/bam/*.bam --threads 24 -x fa --output-directory ${PWD}/lorikeet_results/

echo 'END: '$(date)
echo '---------------'