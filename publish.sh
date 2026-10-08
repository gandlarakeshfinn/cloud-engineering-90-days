#!/bin/bash
echo "--- Starting Automated Backup ---"
echo "Log update for: $(date)" >> ~/cloud_journal/week2/daily_log.txt

git add .
git commit -m "Automated log update: $(date)"
git push origin master

echo "--- Backup Complete and Pushed to GitHub! ---"
