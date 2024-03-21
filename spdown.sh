#!/bin/bash
generate_filename() {
    local filename
    filename="response_$(date +%s%N).txt"
    echo "$filename"
}

echo "Enter video manifest link :"
read link

new_filename=$(generate_filename)

curl "$link" -o "$new_filename"

if [ $? -eq 0 ]; then
    echo "[+] Video manifest file downloaded"
else
    echo "[-] Failed to download video manifest file."
fi
