#!/bin/bash

# Temporary file paths
IMAGE_PATH=$(mktemp)
TEXT_PATH=$(mktemp)

# Take a screenshot of a selected region with Flameshot
flameshot gui --raw > "$IMAGE_PATH"

# Perform OCR with Tesseract and save the output to a text file
tesseract "$IMAGE_PATH" "$TEXT_PATH" --dpi 300 -l eng > /dev/null 2>&1

# Copy the recognized text to the clipboard using xclip
xclip -selection clipboard < "${TEXT_PATH}".txt

# Notify the user that text has been copied
notify-send "OCR" "Text copied to clipboard!"
