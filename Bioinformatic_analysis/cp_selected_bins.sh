#!/bin/bash
#SBATCH -J cp_bins
#SBATCH --partition=amd
#SBATCH -t 2:00:00
#SBATCH --error=cp_err
#SBATCH --mem=16G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

input_fld="/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/PerSmplsBins_DB_MultiBinning"
list_file="/gpfs/space/home/pantiukh/2022_MAGs_DB/run_bins_clusters/archaea_bins.csv"
dest_dir="/gpfs/space/home/pantiukh/2022_MAGs_DB/run_bins_clusters/bins"

while IFS= read -r line
do
  cp -n "$input_fld/$line" "$dest_dir"
done < "$list_file"
