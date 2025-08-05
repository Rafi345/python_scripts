import os
import shutil

reports_dir = "reports"

if not os.path.exists(reports_dir):
    os.mkdir(reports_dir)
    print(f"'{reports_dir}' directory created.")
else:
    print(f"'{reports_dir}' directory already exists.")

for file in os.listdir():
    if os.path.isfile(file) and file.endswith(".txt"):
        print(f"Found .txt file: {file}")
        
        
        shutil.move(file, os.path.join(reports_dir, file))
        print(f"Moved '{file}' to '{reports_dir}/'")
