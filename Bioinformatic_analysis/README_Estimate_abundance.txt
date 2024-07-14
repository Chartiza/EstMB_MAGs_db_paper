## Remove host DNA from reads
Note: These scripts are designed for remove human host DNA from reads.

# Author
Author: Kateryna Pantiukh
Email: pantiukh@gmail.com

# Prerequisites

Before running the binning process, ensure you have reads file in folder/folders. 
For small number of samples you can use remove_hostDNA.sh, if you have 5+ samples it is better to run them simultaneously run_clean_array.sh

# Getting Started

Follow these steps to initiate the binning process:

1. Modify Pathways to the reads and bNAME, R1, R2 and Rfld variables.
2. Executable Scripts: If not done previously, make the scripts executable by running the command:

chmod +x remove_hostDNA-for_array_run.sh 

3. Running the main scripts. Execute the following command to initiate the process:

sbatch run_clean_array.sh

For any questions or additional details, please feel free to contact the author via email.
