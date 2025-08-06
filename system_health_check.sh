#!/bin/bash

DATE=$(date +"%Y-%m-%d")

PROCESS_LOG="process_log_${DATE}.log"
ps -e > "$PROCESS_LOG"
echo "Running processes logged to $PROCESS_LOG"

HIGH_MEM_COUNT="N/A (not supported in Git Bash)"
echo " Memory usage check is not supported in Git Bash."

DISK_USAGE=$(df -h /c | awk 'NR==2 {print $5}' | tr -d '%')

if [[ "$DISK_USAGE" =~ ^[0-9]+$ ]] && [ "$DISK_USAGE" -gt 80 ]; then
    echo " WARNING: Disk usage on /c is above 80% (${DISK_USAGE}%)."
else
    echo " Disk usage on /c is ${DISK_USAGE}%."
fi

TOTAL_PROCESSES=$(ps -e | wc -l)

echo ""
echo "  System Health Check Summary"

echo "Total number of running processes: $TOTAL_PROCESSES"
echo "Processes using >30% memory: $HIGH_MEM_COUNT"
echo "Disk usage on /c partition: ${DISK_USAGE}%"

