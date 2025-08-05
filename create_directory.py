
import os
folder_name="test2"

if not os.path.exists(folder_name):
    os.mkdir(folder_name)
    print(f"'{folder_name}' has been created.")
else:
    print(f"'{folder_name}' already exists.")