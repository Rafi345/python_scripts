import os

for item in os.listdir():
   
    if os.path.isfile(item) and item.endswith(".txt"):
        print(item)