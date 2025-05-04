#!/bin/bash

# SSH details
REMOTE_USER="root"
REMOTE_HOST="159.65.158.178"
REMOTE_PASSWORD="yu2iu9s00XWaMnf"
CODE_LOCATION="/root/targetboard-webs"

# SSH into the remote machine and execute commands
sshpass -p $REMOTE_PASSWORD ssh $REMOTE_USER@$REMOTE_HOST << EOF
  # Load NVM environment for the root user
  export NVM_DIR="/root/.nvm"
  [ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"  # This loads nvm

  # Change to the code directory
  cd $CODE_LOCATION

  # Pull the latest code
  git pull
  git pull

  # Install dependencies
  npm i

  # Restart the backend using pm2
  pm2 restart backend
EOF
