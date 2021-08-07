#!/bin/bash

FOLDER=$1
EXCLUDE=$2
echo "searching for CRLF endings in: $FOLDER"

FILES_TYPES="$(find "$FOLDER" ! -path "./.git/*" -not -type d -exec file "{}" ";")"
FILES_WITH_CRLF=$(echo "$FILES_TYPES" | grep " CRLF " | cut -d " " -f 1 | cut -d ":" -f 1)

for word in $EXCLUDE; do
  FILES_WITH_CRLF=$(echo "$FILES_WITH_CRLF" | grep --invert-match -E "$word")
done

BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

if [ -z "$FILES_WITH_CRLF" ]; then
  echo -e "${BOLD_GREEN}No files with CRLF endings found.${NO_COLOR}"
  exit 0
else
  NR_FILES=$(echo "$FILES_WITH_CRLF" | wc -l)
  echo -e "${BOLD_RED}Found ${NR_FILES} files with CRLF endings.${NO_COLOR}"
  echo "$FILES_WITH_CRLF"
  exit "$NR_FILES"
fi
