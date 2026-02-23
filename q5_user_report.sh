#!/bin/bash
# q5_user_report.sh
# This script generates a user account report with basic security checks

echo "------------- USER ACCOUNT REPORT -------------"

# Total number of users
total_users=$(cut -d: -f1 /etc/passwd | wc -l)
echo "Total number of user accounts: $total_users"
echo ""

# List all users
echo "List of all users:"
cut -d: -f1 /etc/passwd
echo ""

# Users with UID >= 1000 (normal users)
echo "Regular users (UID >= 1000):"
awk -F: '$3 >= 1000 {print $1}' /etc/passwd
echo ""

# Currently logged-in users
echo "Currently logged-in users:"
who
echo ""

# Users with empty password fields (security risk)
echo "Checking for accounts with empty passwords..."
empty_pass=$(awk -F: '($2==""){print $1}' /etc/shadow 2>/dev/null)

if [ -z "$empty_pass" ]; then
    echo "No accounts with empty passwords found."
else
    echo "Users with empty passwords:"
    echo "$empty_pass"
fi
echo ""

# Last login details
echo "Last login details:"
last -a | head -5

echo ""
echo "-------------- REPORT COMPLETE ----------------"
