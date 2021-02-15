#!/bin/bash

COMMAND="ifconfig | grep rndis0 -n8 | grep addr:192 | tr -s ' ' | cut -d ' ' -f 3 | tr -d '[:alpha:]:'"

adb shell -T -x "$COMMAND"
