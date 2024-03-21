#!/bin/bash
generate_filename() {
    local filename
    filename="response_$(date +%s%N).txt"
    echo "$filename"
}

echo "Enter video manifest link :"
read vlink

echo "Enter video name to save :"
read save_name


new_filename=$(generate_filename)

curl "$vlink" -o "$new_filename"

if [ $? -eq 0 ]; then
    echo "[+] Video manifest file downloaded"
else
    echo "[-] Failed to download video manifest file."
fi


if [ -f "$new_filename" ]; then

    ffmpeg -i "$new_filename" -codec copy "$save_name"

    if [ $? -eq 0 ]; then
        echo "[+] Video downloaded successfully and saved as: $save_name"
    else
        echo "[-] Error: Failed to download video."
    fi
else
    echo "[-] Error: File '$filename' not found."
fi
