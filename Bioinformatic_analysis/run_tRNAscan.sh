#!/bin/bash
#SBATCH -J tRNAscan
#SBATCH --partition=amd
#SBATCH -t 40:00:00
#SBATCH --error=tRNAscan_err
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

module load trnascan-se/2.0.0

PWD=$(pwd)
Mags='/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Representative_MAGs_HQcl'
mkdir -p $PWD/tRNAscan_results
output="${PWD}/tRNAscan_results"

for bns in $Mags/H21*.fa; do

  # extract the basename
  bnN=$(basename $bns .fa)
  # delete the extension
  bnN=${bnN%.fa}
  echo $bnN

  tRNAscan-SE -B $bns >> "${output}/${bnN}_tRNAscan_results.csv"

done
