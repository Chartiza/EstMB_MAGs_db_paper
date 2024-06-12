#!/bin/bash
#SBATCH -J BnCl-Fn
#SBATCH --partition=amd
#SBATCH -t 190:00:00
#SBATCH --error=BinsCl_errFn
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=18
#SBATCH --mem=64G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

#conda activate default
module load mummer/3.23 any/ANIcalculator/v1

PWD=$(pwd)
mkdir -p clustr_results_AlmediaHq
output="${PWD}/clustr_results_AlmediaHq"
bins="${PWD}/bins"

echo 'Start clusterins ...'
echo $(date)

dRep dereplicate -p 18 -sa 0.95 --checkM_method taxonomy_wf -comp 25 -con 50 --S_algorithm fastANI --multiround_primary_clustering --greedy_secondary_clustering --run_tertiary_clustering $output -g $bins/*.fa

echo $(date)
module purge
