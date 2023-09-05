#!/bin/bash
#Raw HTML temporary data extraction using curl / mktemp commands

read -p "Enter a URL: " url # Prompt the user for a URL
read -p "Do you want to extract the raw code to a temporary file? (Y/N): " source

# html file extraction
if [[ $source == "Y" || $source == "y" ]]; then
  read -p "Enter a filename to save the raw code: " filename
  curl -s "$url" -o "$filename".html && echo "Raw code extracted to $filename".html
  echo "opening.." 
  code --reuse-window "$filename".html
else
    echo "Opening view-source code in browser: $website" && start "view-source:$url" # Web browser html view-source   

fi