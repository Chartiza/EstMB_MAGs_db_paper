#!/bin/bash
#SBATCH -J barrnap
#SBATCH --partition=amd
#SBATCH -t 4:00:00
#SBATCH --error=barrnap_err
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

module load barrnap/0.8

PWD=$(pwd)
Mags='/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Representative_MAGs_HQcl'
mkdir -p $PWD/rRNA_results
output="${PWD}/rRNA_results"

for bns in $Mags/*.fa; do

  # extract the basename
  bnN=$(basename $bns .fa)
  # delete the extension
  bnN=${bnN%.fa}
  echo $bnN

  barrnap --reject 0.01 --evalue 1e-3 --threads 12 $bns >> "${output}/${bnN}_tRNAscan_results.csv"

done
