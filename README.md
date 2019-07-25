# pstart


Fixes for small bugs encountered.
Problem: `bats-core` has a method for calling tests, and sourcing a file, which
then source another file as part of its dependencies, breaks the files.
Solution: Put the `/lib` directory files into `/usr/lib`, (ordinarily, I would use `/lib` but
the directory is only part of the `Linux FHS`, it's not `POSIX` compliant, so other
OS's would encounter issues.
Implementation Details: Create a `makefile` rule that will run an `install` of the
`/lib/*.sh` files in the repository, and install them into `/usr/lib`, so that the
root binary can source them regardless of where it is called from, whether
through the main binary, or throught the test suite.

The best possible approach could be to utilise something along the lines of the
autotools project, with a `configure` and `make` style process similar to that of
old school projects, providing a tonne of exisiting automation functionality.

https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/autoconf.html

# Great little blog post on the use of the autotools project
https://thoughtbot.com/blog/the-magic-behind-configure-make-make-install

#### Make Commands

| command | description |
| ------- | ----------- |
| setup_git_hooks | Creates all your git hooks from templates provided in the `hooks` directory |
| install  | Perform all "pre-use" actions required for effective use of the project |
