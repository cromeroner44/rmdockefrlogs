#!/bin/bash

# Specify the path to the containers directory
DOCKER_CONTAINERS_DIR="/var/lib/docker/containers"
MAX_LOG_SIZE=$((100 * 1024 * 1024)) # 100 MB in bytes

# Function to clear all *.log files
clean_logs() {
    find "$DOCKER_CONTAINERS_DIR" -type f -name "*.log" -exec truncate -s 0 {} \;
    echo "All *.log files in the $DOCKER_CONTAINERS_DIR directory and its subdirectories have been cleared."
}

# Function to limit the size of logs to 100 MB
limit_log_size() {
    find "$DOCKER_CONTAINERS_DIR" -type f -name "*.log" | while read -r log_file; do
        log_size=$(stat -c%s "$log_file")
        if [ "$log_size" -gt "$MAX_LOG_SIZE" ]; then
            truncate -s "$MAX_LOG_SIZE" "$log_file"
            echo "File $log_file has been truncated to 100 MB."
        fi
    done
}

# Function to restart Docker with a flag
restart_docker_with_flag() {
    echo "Restarting Docker with the flag --log-level=debug"
    sudo systemctl restart docker.service --no-block
    echo "Docker has been restarted."
}

# Parse command-line flags
RESTART_DOCKER=false

while getopts ":r" opt; do
  case ${opt} in
    r )
      RESTART_DOCKER=true
      ;;
    \? )
      echo "Invalid flag: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Perform log cleanup
clean_logs

# Apply log size limit
limit_log_size

# Check if Docker needs to be restarted
if [ "$RESTART_DOCKER" = true ]; then
    restart_docker_with_flag
fi

echo "Log management completed."
