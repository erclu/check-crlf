#!/bin/bash

printf "searching for CRLF endings in: $1\n"
# TODO allow multiple paths with $@ instead of $1

BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
NC='\033[0m'

FILES_TYPES="$(\
    find . ! -path "./.git/*" -not -type d  -exec file "{}" ";"
)"

FILES_WITH_CRLF=$(echo "$FILES_TYPES" | grep " CRLF " | cut -d " " -f 1 | cut -d ":" -f 1)

for word in $2
do
    FILES_WITH_CRLF=$(echo "$FILES_WITH_CRLF" | grep "^./$word" --invert-match)
done

if [ -z "$FILES_WITH_CRLF" ]
then
    printf "${BOLD_GREEN}No files with CRLF endings found.${NC}"
    exit 0
else
    NR_FILES=$(echo "$FILES_WITH_CRLF" | wc -l)
    printf "${BOLD_RED}Found $NR_FILES files with CRLF endings.${NC}"
    printf "$FILES_WITH_CRLF"
    exit $NR_FILES
fi
