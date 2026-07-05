# Directory Bloat Monitoring System using Bash & Cron Automation (Linux System Administration)

## Overview
This project is a Linux system administration tool developed using Bash scripting to monitor directory disk usage in real-time. It detects directory bloat, logs system status changes, and automatically recovers when usage returns to normal.

The system is integrated with Cron to ensure it runs automatically on system boot without manual execution.

---

## Features
- Monitors directory size (default: /tmp)
- Runs continuously at fixed intervals (60 seconds)
- Detects directory bloat based on size threshold
- Displays status changes (OK / WARNING / RECOVERY)
- Automatically starts on system boot using Cron (@reboot)
- Includes stop script to terminate background process safely
- Supports testing using simulated large file creation (dd command)

---

## Technologies Used
- Bash Scripting
- Linux Operating System
- Cron Scheduler
- Process Management (ps, pkill)
- Disk Usage Tools (du, df)

---

## Project Files
dir_monitor.sh          -> Main monitoring script  
dir_monitor-stop.sh     -> Script to stop monitoring process  
README.md               -> Project documentation  

---

## How to Run the Project

### 1. Start Monitoring Script
chmod +x dir_monitor.sh
./dir_monitor.sh

The script will run in the background and monitor the /tmp directory every 60 seconds.

---

### 2. Enable Auto Start on Boot (Cron Job)
crontab -e

Add the following line:
@reboot /bin/bash /home/jiaxuan/dir_monitor.sh

This ensures the script starts automatically whenever the system boots.

---

### 3. Stop Monitoring Script
chmod +x dir_monitor-stop.sh
./dir_monitor-stop.sh

This will terminate the running monitoring process.

---

## Test Case (Directory Bloat Simulation)

Create a 200MB test file:
dd if=/dev/zero of=/tmp/testfile bs=1M count=200

This helps verify:
- Directory size increase detection
- WARNING state trigger
- Recovery after file removal

Remove test file:
rm /tmp/testfile

---

## Verification Commands

Check running process:
ps -ef | grep dir_monitor.sh

Check cron job:
crontab -l

Verify stop script:
./dir_monitor-stop.sh
ps -ef | grep dir_monitor.sh

---

## Learning Outcomes
- Bash scripting for system automation
- Linux resource monitoring
- Cron job scheduling and automation
- Process control in Linux
- Real-time directory usage tracking
