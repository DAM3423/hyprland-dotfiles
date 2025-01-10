#!/usr/bin/env bash

#!/bin/bash

# Check if wvkbd-mobintl is currently running
if pgrep -x "wvkbd-mobintl" > /dev/null; then
  # If running, kill the process
  pkill -x "wvkbd-mobintl"
  echo "Mobile International Keyboard disabled."
else
  # If not running, start the process
  wvkbd-mobintl
  echo "Mobile International Keyboard enabled."
fi

exit 0
