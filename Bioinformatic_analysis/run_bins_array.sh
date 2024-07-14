#!/bin/bash
#SBATCH -J BinsArray
#SBATCH --partition=amd
#SBATCH --array=0-2
#SBATCH -t 190:00:00
#SBATCH --error=error_BinsArray
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

input_dir='/gpfs/space/GI/GV/EGCUT_data/omics_data/microbiomics/BGI_cleaned'
runFld=$(pwd)
subfolders_file=subfolders.txt

# Find all "reads" files in all subdirectories, excluding the specified subfolders
SUB_LIST=($(<subfolders.txt))
SUB=${SUB_LIST[${SLURM_ARRAY_TASK_ID}]}
SUB=$(echo "$SUB" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')  

# Define the command to run your script on a single input file
cmd="$runFld/get_bins_multiBinning_only.sh"

# Use the task ID to select the subdirectory for this job
#subdir=$(ls $input_dir | sed -n "${SLURM_ARRAY_TASK_ID}p")
sample=$(echo "$SUB" | cut -d '_' -f 2)

# Select the input file for this subdirectory
R1="$input_dir/$SUB/filtered_nohost1.fq.gz"
R2="$input_dir/$SUB/filtered_nohost2.fq.gz"

# Run the command on the selected input file, with output to a unique file
$cmd $SUB $R1 $R2 $sample
