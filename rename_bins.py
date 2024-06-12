import os

# Path to the directory containing the files
directory = "./bins"

# Iterate over all files in the directory
for filename in os.listdir(directory):
    if filename.endswith(".fna"):
        # Construct the full file path
        old_file = os.path.join(directory, filename)

        # New file name with .fa extension
        new_file = os.path.join(directory, filename[:-4] + ".fa")

        # Rename the file
        os.rename(old_file, new_file)
        print(f"Renamed '{old_file}' to '{new_file}'")

print("Renaming complete.")
