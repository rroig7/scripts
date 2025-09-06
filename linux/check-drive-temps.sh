#!/bin/bash

# List of drives to check
drives=(sdb sdc sdd sde)

for drive in "${drives[@]}"; do
    echo "=== /dev/$drive ==="
    # Run smartctl and grep the temperature lines
    sudo smartctl -a /dev/$drive | grep -E "Current Drive Temperature|Drive Trip Temperature"
    echo
done

