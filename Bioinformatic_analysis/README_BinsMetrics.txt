## Contig Binning Scripts
Note: These scripts are designed for getting basic bins metrics as completeness, contamination and taxanomic annotation. 

# Author
Author: Kateryna Pantiukh
Email: pantiukh@gmail.com

# Prerequisites

Before running the binning evaluation process, ensure you have the following in place:

Bins: Scripts are fitted the BGI reads structure only. Check the bins location. Change it if needed at all scripts. Current location:
/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/PerSmplsBins_DB_MultiBinning_v2
Pathways: All paths (except Bins fld) are set as relative, which means you can freely relocate entire folders, but it's essential to maintain the necessary input files for running the scripts.
Files: check presence of needed files in the folder: run_cm2.sh, run_gtdb.sh

# Getting Started

To get the main Bins metrics, you need to run three programs in parallel.

1. Evaluate completeness and contamination with CheckM2 (run the command for all bins in the folder together). Remember to switch to the correct environment.

conda activate checkm2
sbatch run_cm2.sh

2. Get taxonomic classification for all bins with GTDB-tk. Remember to switch to the correct environment.

sbatch run_gtdb.sh

3. Get genomes size and CG content info. Run the SeqKit from command line:

module load seqkit/2.3.1
seqkit stats /gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/PerSmplsBins_DB_MultiBinning_v2/*.fa -a -T > bins_stats.txt

4. Collect the results files:
- PWD/cm2/quality_report.tsv
- PWD/gtdb/
- PWD/bins_stats.txt


For any questions or additional details, please feel free to contact the author via email.
