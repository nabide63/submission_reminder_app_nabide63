#!/usr/bin/env bash

#Asking user name
echo "Enter your name:  "

# Input the name and store it in variable called Name
read Name

# Storing user directory
my_dir="submission_reminder_$Name"

# creating the directory
mkdir $my_dir

# Creating sub-directories
mkdir $my_dir/{app,config,assets,modules}

# Creating files and populating them
cat <<'EOF' > $my_dir/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

cat <<'EOF' > $my_dir/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

cat <<'EOF' > $my_dir/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Simon, Python, not submitted
Waiswa, E-lab, submitted
Phillip, SDL, submitted
Karim, Loops, not submitted
Benjamin, Strings, submitted
EOF

cat <<'EOF' > $my_dir/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Creating a startup.sh file: No.4
cat <<EOF > $my_dir/startup.sh
#!/usr/bin/env bash
cd $my_dir
bash app/reminder.sh
EOF

# Execution permissions to startup.sh
chmod u+x $my_dir/startup.sh
bash $my_dir/startup.sh     #Executing this startup.sh will in turn execute reminder.sh
