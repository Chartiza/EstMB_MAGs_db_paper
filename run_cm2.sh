#!/bin/bash
#SBATCH -J cm2_rep
#SBATCH --partition=amd
#SBATCH -t 26:00:00
#SBATCH --error=cm2_rep_error.txt
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G

module load any/python
source activate checkm2

PWD=$(pwd)
Bins='/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Representative_MAGs_HQcl/'

echo 'Run CheckM2'
echo $(date)
echo '...'

mkdir -p $PWD/cm2/
checkm2 predict --threads 30 -x fa --input $Bins --output-directory $PWD/cm2_representatives/
