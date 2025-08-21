The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter, and they need to create a bash script named beta_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3).


a. Create a zip archive named xfusioncorp_beta.zip of /var/www/html/beta directory.


b. Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.


c. Copy the created archive to Nautilus Backup Server server in /backup/ location.


d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.


Note:
The zip package must be installed on given App Server before executing the script. This package is essential for creating the zip archive of the website files. You can install it either manually or through the bash script as needed.



#!/bin/bash

# -----------------------------
# Variables
# -----------------------------
SOURCE_DIR="/var/www/html/beta"
BACKUP_DIR="/backup"
ARCHIVE_NAME="xfusioncorp_beta.zip"
REMOTE_USER="clint"
REMOTE_HOST="stbkp01.stratos.xfusioncorp.com"
REMOTE_DIR="/backup"

# -----------------------------
# Ensure backup directory exists
# -----------------------------
mkdir -p "$BACKUP_DIR"

# -----------------------------
# Install zip if missing
# -----------------------------
if ! command -v zip &> /dev/null; then
    echo "zip not found. Installing..."
    if command -v yum &> /dev/null; then
        sudo yum install -y zip
    elif command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y zip
    else
        echo "No supported package manager found. Please install zip manually."
        exit 1
    fi
fi

# -----------------------------
# Create zip archive
# -----------------------------
echo "Creating backup archive..."
zip -r "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR"

if [ $? -ne 0 ]; then
    echo "Error: Failed to create zip archive."
    exit 1
fi

# -----------------------------
# Copy backup to Nautilus Backup Server
# -----------------------------
echo "Copying backup to $REMOTE_HOST..."
scp "$BACKUP_DIR/$ARCHIVE_NAME" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

if [ $? -eq 0 ]; then
    echo "Backup successfully copied to $REMOTE_HOST:$REMOTE_DIR"
else
    echo "Error: Failed to copy backup to $REMOTE_HOST"
    exit 1
fi


chmod +x /scripts/beta_backup.sh


# On stapp03 as banner
ssh-keygen -t rsa
ssh-copy-id clint@stbkp01.stratos.xfusioncorp.com


/scripts/beta_backup.sh

#and finally you can test weater the zip file is avilable or not in the backup server by loggin in to the backup server again