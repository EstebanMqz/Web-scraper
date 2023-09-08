#!/bin/bash
#Raw HTML temporary data extraction using curl / mktemp commands

read -p "Enter a URL: " url 
read -p "Do you want to extract the raw code to a temporary file? (Y/N): " source

# curl HTTP GET request HTML extraction 
if [[ $source == "Y" || $source == "y" ]]; then
  read -p "Enter a filename to save the raw code: " filename
  curl -s "$url" -o "$filename".html && echo "Raw code extracted to $filename".html
  # css=$(grep -o '<link rel="stylesheet" href=".*">' "$filename".html) && echo "CSS elements found: $css"
  # js=$(grep -o '<script src=".*"></script>' "$filename".html) && echo "JavaScript elements found: $js"
  # php=$(grep -o '<?php.*?>' "$filename".html) && echo "PHP code found: $php"
  echo "opening.." 
  code --reuse-window "$filename".html
else
    echo "Opening view-source code in browser: $website" && start "view-source:$url"   
fi