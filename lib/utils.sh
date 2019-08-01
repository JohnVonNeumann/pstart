#!/bin/bash
#===============================================================================
#
#          FILE: utils.sh
#
#         USAGE: ./utils.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 13/07/2019 13:06
#      REVISION:  ---
#===============================================================================

# set -o posix    # keep the codebase standard
set -o pipefail     # if a pipe stage fails, throw errors
# set -o nounset  # treat unset variables as an error

#######################################
# Perform an integrity check on a file to mitigate the chances of race
# conditions in file create/write loops.
# Globals:
#   NONE
# Arguments:
#   None
# Returns:
#   0 - Success
#   3 - File is not empty.
#   4 - Input must be a file.
#######################################
utils::file_integrity_check()
{
  if [[ $# -ne 1 ]]; then
    echo "Error: Incorrect number of arguments." >&2
    exit 5
  else
    if [ -f "$1" ]; then
      if [ -s "$1" ]; then
        echo "File is not empty." >&2
        exit 3
      fi
    else
      echo "Error: Input must be a file." >&2
      exit 4
    fi
  fi
}
