#!/bin/bash
#SBATCH -J gtdb
#SBATCH --partition=amd
#SBATCH -t 190:00:00
#SBATCH --error=gtdb_err
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

module load py-gtdbtk
module load py-pydantic
echo $GTDBTK_DATA_PATH

Bins='/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/PerSmplsBins_DB_MultiBinning_v2/'
PWD=$(pwd)

mkdir -p "$PWD/gtdb"
echo $(date)

# Run GTDB
gtdbtk classify_wf --genome_dir $Bins --out_dir $PWD/gtdb --skip_ani_screen --cpus 18 --scratch_dir $PWD/gtdb/scratch_dir -x fa

echo $(date)
module purge