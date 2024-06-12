#!/bin/bash
#SBATCH -J BinsArray
#SBATCH --partition=amd
#SBATCH --array=0-104%10
#SBATCH -t 190:00:00
#SBATCH --error=error_BinsArray
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=120G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

input_dir='/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Cleaned_reads/unique_smpls_set/' #bgi_CRC003_nohost.fq1.gz
runFld=$(pwd)

# Find all "reads" files in all subdirectories, excluding the specified subfolders
SUB_LIST=($(<smpls.csv))
SUB=${SUB_LIST[${SLURM_ARRAY_TASK_ID}]}
# remove leading and trailing whitespace (spaces or tabs) 
SUB=$(echo "$SUB" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')  
#define sample name
sample=$(echo "$SUB")

# Define the command to run your script on a single input file
cmd="$runFld/get_coverM.sh"

# Run the command on the selected input file, with output to a unique file
$cmd $sample
