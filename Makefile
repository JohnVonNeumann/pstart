HOOK_DIR:=$(shell ls -1 -d hooks/*)
LIB_DIR=/usr/local/lib/pstart

# setup_git_hooks:
# Runs `ln` over the contents of the $HOOK_DIR environmental variable, to create
# git hooks within the `.git/hooks` directory. Ideally, each of these files in
# the $HOOK_DIR being a template git hook file.
# e.g.: pre-commit, pre-push.
#
# Environmental Variables:
# 	HOOK_DIR: An interpolated command that returns a list of all files within
# 	the `hooks/` directory.
setup_git_hooks:
	for hook_file in $(HOOK_DIR); do \
		ln -Ff $$hook_file .git/hooks/; \
	done

# install:
# Performs all "pre-use" actions required for both the binary and tests to work.
#
# Environmental Variables:
# 	LIB_DIR: The path of the directory we wish to keep our `lib` files in.
install:
	mkdir $(LIB_DIR) && cp lib/utils.sh $(LIB_DIR)
