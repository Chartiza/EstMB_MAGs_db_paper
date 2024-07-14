import os
import pandas as pd

# Get a list of all files in the current directory that start with 'bgi'
dir_path = '/gpfs/space/home/pantiukh/2022_MAGs_DB/run_module6_Estimate_abundance/abud_results'  # current directory
filenames = [f for f in os.listdir(dir_path) if f.startswith('abud')]

# Initialize an empty DataFrame to store the merged data
merged_df = pd.DataFrame()

for i, filename in enumerate(filenames):
    # Read each file into a pandas DataFrame
    df = pd.read_csv(os.path.join(dir_path, filename), sep='\t')

    # Get the file name without extension
    filename_no_ext = os.path.splitext(filename)[0]

    # If this is the first file, initialize the merged_df DataFrame
    if i == 0:
        merged_df = df
        merged_df.columns = ['rep_MAG_ID', filename_no_ext]  # Rename the column to the file's name (without extension)
    else:
        # If this is not the first file, merge it with the existing DataFrame
        df_temp = df
        df_temp.columns = ['rep_MAG_ID', filename_no_ext]  # Rename the column to the file's name (without extension)
        merged_df = pd.merge(merged_df, df_temp, on='rep_MAG_ID', how='outer')

# Replace all NaN values with 0 (you can skip this step if NaN values are fine)
merged_df.fillna(0, inplace=True)

# Write the merged DataFrame to a CSV file
merged_df.to_csv('SpLevel_RelAbund_merged_output.csv', index=False) 
