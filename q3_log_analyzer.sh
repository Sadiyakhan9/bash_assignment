#!/bin/bash
# q3_log_analyzer.sh
# This script analyzes a log file and displays useful statistics

echo "----------- LOG FILE ANALYZER -----------"

# Ask user for log file path
read -p "Enter the full path of the log file: " logfile

# Check if file exists
if [ ! -f "$logfile" ]; then
    echo "Error: File does not exist!"
    exit 1
fi

echo ""
echo "Analyzing log file: $logfile"
echo "-----------------------------------------"

# Total number of lines
total_lines=$(wc -l < "$logfile")
echo "Total number of lines: $total_lines"

# Count ERROR entries
error_count=$(grep -i "error" "$logfile" | wc -l)
echo "Number of ERROR entries: $error_count"

# Count WARNING entries
warning_count=$(grep -i "warning" "$logfile" | wc -l)
echo "Number of WARNING entries: $warning_count"

# Count INFO entries
info_count=$(grep -i "info" "$logfile" | wc -l)
echo "Number of INFO entries: $info_count"

# Extract IP addresses and show most frequent (if any)
echo ""
echo "Most frequent IP address (if present):"
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$logfile" | \
sort | uniq -c | sort -nr | head -1

# Show last 5 lines of log
echo ""
echo "Last 5 lines of the log file:"
tail -5 "$logfile"

echo "-----------------------------------------"
echo "Log analysis completed."
