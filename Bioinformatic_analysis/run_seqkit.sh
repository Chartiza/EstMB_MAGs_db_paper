#!/bin/bash
#SBATCH -J seqkit
#SBATCH --partition=amd
#SBATCH -t 2:00:00
#SBATCH --error=seqkit_err
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=16G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

module load seqkit/2.3.1

echo $(date)

# Run seqkit
seqkit stats /gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Representative_MAGs_HQcl/*.fa -a -T > rep_MAGs_stats.txt

echo $(date)
module purge