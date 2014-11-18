# [Flannel][readme-md] - Thrift *( module sharing )*

Utilities to install non-core (contributed) modules! Moduels are installed under /contrib/<git_user>/repo_name<branch>[revision]/repo_contents

the base of each module is supposed to contain a dependencies.thrift which provides the dependencies of the repo, intended just to link to

other repos but it will be interpreted as bash so if you want to hook in crazy things.. feel free, just don't expect people to use your

module.

This module is actually one command internal to your module, and 3 management commands as follows

Note that this set of utilities does not baby you in any way, try ot be careful were in bash, it bashes.

not a whole lot of thought to what it bashes

---

### `thrift_fetch` *fetch a repo to add to contrib*

clones repo

### Syntax

`thrift_fetch <git uri> <username> <repo> [branch_or_tag] [revision_hash]`

### Pseudo Code

1. if local path doesnt exist create it
2. else make sure we are the relevant revision
---

### `thrift_install` *installs dependencies for a module*

Installs any immediately listed dependencies of the given package

### Syntax

`thrift_install <module>`

Where <module> is the base module you need

---

### `thrift_clean` *remove any installed dependencies*

removes installed dependencies, keeps deps if they are needed elsewhere

### Syntax

`thrift_clean <module>`

where *<module>* is the module to clean

---

### `thrift_remove` *removes selected repo from contrib*

initially just a wrapper to rm -Rf repo dir

### Syntax

`thrift_remove <module>`

where <module> is base of repo to remove

[readme-md]: ../../README.md "Flannel Readme"
