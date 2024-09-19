#!/bin/bash
# Log file parser for systemd and OpenRC

# Using a function to display a message and exit
exit_message() {
    echo "$1"
    exit 1
}

# Welcome message to user
echo "Welcome $USER, this script will parse your general system logfile and allow you to filter by error type."

# Prompt user for their init system
echo "Which init system do you use, systemd or OpenRC?"
echo "Note: Only select OpenRC if you have rc.log enabled in /etc/rc.conf, if not systemd option will also work."
read -p "Please enter 'systemd' or 'OpenRC'): " init

# Check user input
if [ "$init" != "systemd" ] && [ "$init" != "OpenRC" ]; then
    exit_message "Only 'systemd' or 'OpenRC' are allowed."
else
    echo "$init selected"
fi

# Assign log file paths based on init system selected
if [ "$init" == "systemd" ]; then
    log_file="/var/log/syslog"
elif [ "$init" == "OpenRC" ]; then
    log_file="/var/log/rc.log"
fi

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    exit_message "Log file $log_file does not exist. You are probably using a different init system."
else 
    echo "Log $log_file found"
fi

# List of patterns user can select from
patterns=("error" "warning" "failed" "critical")

# Prompt user for which type of pattern they would like to filter by
read -p "Which type of error would you like to search for? (Please enter 'error', 'warning', 'failed' or 'critical'): " error_type

# Use exit_message function if user input isn't allowed
# Parse log file for pattern selected using for loops
# For loops use grep piped to wc to give a numerical amount of occurences
if [ "$error_type" != "error" ] && [ "$error_type" != "warning" ] && [ "$error_type" != "failed" ] && [ "$error_type" != "critical" ]; then
    exit_message "Only 'error', 'warning', 'failed' or 'critical' are allowed."
elif [ "$error_type" == "error" ]; then
    for pattern in "${patterns[0]}"; do
        echo -e "Occurrences of '$pattern':"
        grep -i "$pattern" "$log_file" | wc -l
    done
elif [ "$error_type" == "warning" ]; then
    for pattern in "${patterns[1]}"; do
        echo -e "Occurrences of '$pattern':"
        grep -i "$pattern" "$log_file" | wc -l
    done
elif [ "$error_type" == "failed" ]; then
    for pattern in "${patterns[2]}"; do
        echo -e "Occurrences of '$pattern':"
        grep -i "$pattern" "$log_file" | wc -l
    done
elif [ "$error_type" == "critical" ]; then
    for pattern in "${patterns[3]}"; do
        echo -e "Occurrences of '$pattern':"
        grep -i "$pattern" "$log_file" | wc -l
    done
fi

# Informs user that parsing is complete
echo "Log parsing complete."

# Prompts user for whether they'd like to view results or not
read -p "Would you like to view them? (Please enter 'y' or 'n'): " answer 

# Takes variable $pattern assigned from previous for loops and variable $log_file and greps
# Grep is piped to less for easier viewing experience
if [ "$answer" != "y" ] && [ "$answer" != "n" ]; then
    exit_message "Only 'y' or 'n' are allowed"
elif [ "$answer" == "y" ]; then
    grep -i "$pattern" "$log_file" | less
elif [ "$answer" == "n" ]; then
    echo "Ok, exiting"
fi
