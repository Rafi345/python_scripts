import os
input_folder = "data_input"
output_folder = "data_output"

if not os.path.exists(input_folder):
    os.makedirs(input_folder)
    print(f"Folder '{input_folder}' created. Please add .txt files to it and run the script again.")
    exit()
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

summary_lines = []

for filename in os.listdir(input_folder):
    if filename.endswith(".txt"):
        input_path = os.path.join(input_folder, filename)
        output_path = os.path.join(output_folder, filename)

        with open(input_path, "r") as infile:
            lines = infile.readlines()

        modified_lines = []
        line_count = 0
        word_count = 0

        for line in lines:
            stripped = line.strip()
            if stripped == "" or stripped.startswith("#"):
                continue  
            line_count += 1
            word_count += len(stripped.split())
            modified_line = line.replace("temp", "permanent")
            modified_lines.append(modified_line)

        
        with open(output_path, "w") as outfile:
            outfile.writelines(modified_lines)

        
        summary_lines.append(f"{filename:<15}{line_count:<15}{word_count}")

summary_path = os.path.join(output_folder, "summary.txt")
with open(summary_path, "w") as summary_file:
    
    summary_file.write(f"{'Filename':<15}{'Line Count':<15}{'Word Count'}\n")
    summary_file.write("\n".join(summary_lines))

print("Processing completed. Check the 'data_output' folder.")
