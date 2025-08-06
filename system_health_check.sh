#!/bin/bash

# Get current date
DATE=$(date +"%Y-%m-%d")

# 1️⃣ Log Running Processes
PROCESS_LOG="process_log_${DATE}.log"
ps -e > "$PROCESS_LOG"
echo "✅ Running processes logged to $PROCESS_LOG"

# 2️⃣ High Memory Usage Check (Not supported in Git Bash)
HIGH_MEM_COUNT="N/A (not supported in Git Bash)"
echo "⚠️ Memory usage check is not supported in Git Bash."

# 3️⃣ Disk Usage Check on Windows C Drive (/c)
DISK_USAGE=$(df -h /c | awk 'NR==2 {print $5}' | tr -d '%')

if [[ "$DISK_USAGE" =~ ^[0-9]+$ ]] && [ "$DISK_USAGE" -gt 80 ]; then
    echo "⚠️ WARNING: Disk usage on /c is above 80% (${DISK_USAGE}%)."
else
    echo "✅ Disk usage on /c is ${DISK_USAGE}%."
fi

# 4️⃣ Display System Health Summary
TOTAL_PROCESSES=$(ps -e | wc -l)

echo ""
echo "📋  System Health Check Summary"
echo "-------------------------------------"
echo "✅ Total number of running processes: $TOTAL_PROCESSES"
echo "❌ Processes using >30% memory: $HIGH_MEM_COUNT"
echo "✅ Disk usage on /c partition: ${DISK_USAGE}%"
echo "-------------------------------------"
