# submission_reminder_app_nabide63
Individual lab summative
# Submission Reminder App

## Overview
The **Submission Reminder App** is a shell script solution designed to automate the process of checking assignment submissions. It creates a structured directory for the application, sets up necessary configuration files, and provides a script that notifies students who have not submitted their assignments.

## Features
- Automated directory and file setup for the submission reminder application.
- Configuration file for assignment details.
- A reminder script that checks and lists students who have not submitted assignments.
- A startup script to run the application seamlessly.

## Setup Instructions

### Prerequisites
- Linux/macOS terminal with Bash
- Basic understanding of shell scripting
- Execute permissions for shell scripts

### Installation & Usage
1. Clone or download the repository.
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```
2. Grant execute permissions to the script:
   ```bash
   chmod u+x create_environment.sh
   ```
3. Run the script to set up the environment:
   ```bash
   ./create_environment.sh
   ```
4. Enter your name when prompted. A personalized directory (e.g. `submission_reminder_YourName`) will be created.
5. The script will automatically execute `startup.sh`, which runs `reminder.sh` to check pending submissions.

## Script Explanation
- **create_environment.sh**: Main script that creates the project structure, generates necessary files, and sets permissions.
- **app/reminder.sh**: Reads student submissions and prints reminders for pending assignments.
- **modules/functions.sh**: Contains helper functions, including one that checks submissions.
- **config/config.env**: Stores assignment-related configurations (e.g., assignment name and deadline).
- **assets/submissions.txt**: Sample data file containing student submission records.
- **startup.sh**: Runs the reminder script for quick execution.

## Example Output
```
What is your name? John
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Checking submissions in ./assets/submissions.txt
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
```

