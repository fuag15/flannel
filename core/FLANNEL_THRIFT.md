# [Flannel][readme-md] - FLANNEL_THRIFT *( module sharing )*

Utilities to install non-core (contributed) modules! Moduels are installed under /contrib/<username>/<repo>/repo_contents where username and

repo are qualifiers of your choosing to allow for multiple versions of a certain thrift store to play nicelye with eachother if deps get complex

the base of each module is supposed to contain a dependencies.thrift which provides the dependencies of the repo, intended just to link to

other repos but it will be interpreted as bash so if you want to hook in crazy things feel free. Its recommended to use a mixture of thrift_fetch

and thrift_install in the dependencies.thrift file to allow for recursive dependency checking.

This module is actually one command internal to your module, and 3 management commands as follows

Note that this set of utilities does not baby you in any way, try ot be careful were in bash, it bashes.

not a whole lot of thought to what it bashes

---

### `thrift_fetch` *fetch a repo to add to contrib*

clones repo

### Syntax

`thrift_fetch <git uri> <username> <repo> [refspec]`

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

---

## `thrift_update` *updates selected repository in contrib*

updates the repository specified, just a wrapper for git

### Syntax

`thrift_update` <repo uri>

where <repo uri> is the unique identifier for the thrift repository

[readme-md]: ../../README.md "Flannel Readme"
