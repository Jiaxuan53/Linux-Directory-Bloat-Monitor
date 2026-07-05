#!/bin/bash
if pkill -f dir_monitor.sh; then
echo "Monitor stopped successfully."
else
echo "No running monitor script was found."
fi

