# Bash automation scripts

## Table of contents
- [Overview](https://github.com/High-Petrushka/automation-scripts/README.md#overview)
- [Features](https://github.com/High-Petrushka/automation-scripts/README.md#features)
- [Installation](https://github.com/High-Petrushka/automation-scripts/README.md#installation)

## Overview
Bash automation scripts is a set of command line tools for automating rumorous tasks.
It's purpose to decrease amount of tedious steps made to manage the system.
It was written in bash and is suitable for every environment that has the appropriate interpreter.

## Features
- unarch.sh unpacks the *.tar archives, sorts files by it's types, and moves them to the appropriate directories
```bash
# Usage example
./unarch.sh test.tar
```
- log_analyzer.sh reads provided log file and stores specific info about it to the analyze.log file
```bash
# Usage example
./log_analyzer.sh /var/log/kern.log
cat analyze.log

# Output
Total number of lines: 43172

ERROR - 10
WARNING -  43
INFO - 11
DEBUG -  2

First log entry timestamp: 2026-09-29T17:19:32.794995+03:00
Last log entry timestamp: 2026-10-29T10:17:54.089140+03:00
```

- dir_info.sh prints the detailed information about provided directory: how many items it has, how much disk space it takes, what is the most recent edited file
```bash
# Usage example
./dir_info.sh ./my_dir

# Output
Items  |  Space  |  Recent Files
5	        24K	      Oct 8 11:06 guessing_game Oct 7 10:29 Main.class Oct 7 10:29 Main.java
```

- backup.sh accepts a source and destination directory names, creates the backup archive from the source directory, and stores it at the destination directory
```bash
# Usage example
./backup.sh my_dir ./
ls

# Output
14_08_2026.back.tar.gz

tar -ztf 14_08_2026.back.tar.gz

# Output
my_dir/
```

## Inastallation
1. Clone the repository:
`git clone https://github.com/High-Petrushka/automation-scripts`
2. Navigate to the project directory:
`cd automation-scripts`
3. Add execute privileges to the script file:
`chmod +x [script_name]`
4. Run the needed script:
`./[script_name]`
