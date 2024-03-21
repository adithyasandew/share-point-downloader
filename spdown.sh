#!/bin/bash

echo "Enter video manifest link:"
read link

curl "$link" -o video_manifest.txt

if [ $? -eq 0 ]; then
    echo "[+] Video manifest file downloaded"
else
    echo "[-] Failed to download video manifest file."
fi
