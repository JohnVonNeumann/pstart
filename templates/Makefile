# setup_git_hooks:
# Runs `which` against program targets to ensure that the users development
# environment contains all the necessary packages.
#
# Environmental Variables:
# 	PACKAGES: A space separated list of packages required in the users
# 			  environment.
HOOK_DIR:=$(shell ls -1 -d hooks/*)

setup_git_hooks:
	for hook_file in $(HOOK_DIR); do \
		ln -Ff $$hook_file .git/hooks/; \
	done
