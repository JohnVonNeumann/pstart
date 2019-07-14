#!/bin/bash
#===============================================================================
#
#          FILE: pstart.sh
#
#         USAGE: ./pstart.sh
#
#   DESCRIPTION: Start a new project, with good best practices.
#
#       OPTIONS: ---
#  REQUIREMENTS: None.
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: JOHNVONNEUMANN
#===============================================================================

set -o posix    # keep the codebase standard
set -o pipefail     # if a pipe stage fails, throw errors
set -o nounset  # exit if trying to use an uninitialised variable

# Create gitignore file
## have list of common ignores
## ds_store, tags.lock
## make sure it's easy to add in more ignores
create_gitignore ()
{
  local ignores=[".DS_store",".terraform", "*.state"]
  local file=".gitignore"
  touch $file
  # ensure no race conditions
  # validate file is empty && write entries into it
  if [ -s "$file" ]; then
    echo "Newly created file is not empty. Possible race condition. Exiting."
    exit 3
  else
    for each in $ignores; do
      echo $each >> $file;
    done
  fi
}

# create hooks directory
create_hooks_directory () {
  local directory="hooks"
  mkdir $directory
}

# create makefile
create_makefile () {
  local file="makefile"
  touch $file
  # find Makefile in /templates dir

  # cp makefile to the root of the directory
}

# create ci/cd config file
# create_cicd_config_file () {
#   # requires a dictionary/enum data struct for ci tool to config file mappings
#   # take in a parameter with user input, validate then evaluate based on the ds
# }

# create test directory
create_test_directory () {
  local directory="test"
  mkdir $directory
}

# do some arg parsing so you can run a "--all" to run all of them, etc
create_gitignore
