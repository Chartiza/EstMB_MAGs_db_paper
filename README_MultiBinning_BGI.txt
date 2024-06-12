## Contig Binning Scripts
Note: These scripts are designed for contig binning and are optimized for BGI clean data.

# Author
Author: Kateryna Pantiukh
Email: pantiukh@gmail.com

# Prerequisites

Before running the binning process, ensure you have the following in place:

1. Reads: Scripts are fitted the BGI reads structure only. You should have a reads in the location:
'/gpfs/space/GI/GV/EGCUT_data/omics_data/microbiomics/BGI_cleaned'

2. Contigs: You should already have contigs prepared. Contigs for BGI samples should be found in the designated location:
'/gpfs/space/GI/GV/Projects/Microbiome/BGIset_Mags_DB/Contigs_DB/assembly_'

3. Pathways: All paths (except contigs & reads fld) are set as relative, which means you can freely relocate entire folders, but it's essential to maintain the necessary input files for running the scripts.
Files: check presence of needed files in the folder: run_bins_array.sh, get_bins_multiBinning_only.sh, subfolders.txt, depth_for_maxbin.py, Fasta_to_Contig2Bin.sh

# Getting Started

Follow these steps to initiate the binning process:

1. Modify subfolders.txt: Add the names of the selected samples to the <subfolders.txt> file.
2. Executable Scripts: If not done previously, make the scripts executable by running the command:

chmod +x get_bins_multiBinning_only.sh
chmod +x depth_for_maxbin.py

3. Running the Binning Process. Execute the following command to initiate the binning process:

sbatch run_bins_array.sh

4. After completing the previous step, rename the dastool containers by including the sample name in the file name.

sh rename_bins.sh

For any questions or additional details, please feel free to contact the author via email.

# Error Resolution Assistance
1. File <subfolders.txt> could have a linebreak in the end of the line. It could make reads file unreadible. Write the new <subfolders.txt> files.
