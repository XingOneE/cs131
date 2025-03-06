# organize.sh - Smart File Organizer

## What this command does
The `organize` command automatically **sorts files into categorized folders**  
based on file types like Documents, Images, Videos, Music, Archives, and Scripts.

## Why/When this command is useful
- **Reduces clutter** in messy directories.
- **Organizes downloads** automatically.
- **Helps students & professionals keep files structured**.
- **Saves time** compared to manually moving files.

## How you can use this command
### **1️⃣ Organize your `test1` folder**

organize ~/cs131/test1

Output:
Files organized in '/home/xingyu_luo/cs131/test1'.

After running this command, the directory structure changes from:

~/test1/
│── 1.png
│── 2.pdf
│── 3.zip

To:

~/test1/
│── Archives/
│    ├── 3.zip
│── Documents/
│    ├── 2.pdf
│── Images/
│    ├── 1.png
│── Music/
│── Scripts/
│── Videos/

