#!/bin/bash
echo "--- SYSTEM HEALTH REPORT ---"
echo "Date: $(date)"
echo "--- DISK SPACE ---"
df -h | grep "/data"
echo "--- SYSTEM LOAD ---"
uptime
echo "--- REPORT COMPLETE ---"
