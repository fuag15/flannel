# [Flannel][readme-md] - Requires *( Version Requirements Logic )*

This is a spec for the `requires` module which is meant to allow version matching logic for module requirements for the [vfx][vfx-readme] prototype project.

It works closely with [flannel_state][flannel-state-md] so thats some good background to read.

This module assumes your modules are ordered in such a way that they are organized module/[*(module/)]<version>/ and that flanneling the parent provides a default version.

---

### `load_requirement` *THE requires function*

This function will be the end all of requirements. It is designed to take what you need as inputs and use checks against `FLANNEL_STATE` to see if it is needed, if so it flannel's it, if not it just returns

If we pass it no operator or version, it assumes we just want a version and satisfies that by loading the default

If we got a preferred version, load that if it is not already loaded

On a clear it just returns

### Syntax

`load_requirement <module> [{>=,<=,==} <version> <default>] [clear]`

### Pseudo Code

1. if we got a clear
  - return
2. if its in our spool
  - if we did not get a 2nd parameter, were done, return
  - check if it satisfies our operator
  - if so return
  - if not, flannel a satisfactory version
3. else # its not in our spool
  - if we did not get a 2nd parameter flannel the module
  - else flannel the version, or default if supplied

### `requires_bounded_plaid` *THE requires function for bounded reqs*

This function is pretty much the same as load_requirement with extra options. It's been split into two functions in order to keep the syntax simple

### Syntax

`requires_bounded_plaid <module> <lower bound> <upper bound> <default> [clear]`

### Pseudo Code

1. if we got a clear
  - return
2. if its in our spool
  - if its equal to either upper or lower bound then return
  - else if it is greater than our lower and lower than our upper
    - return
3. else nothing is satisfied
  - flannel higher version or default

[flannel-state-md]: ../FLANNEL_STATE.md "Plaid Spool Markdown"
[vfx-readme]: http://github.com/fuag15/thrift-examples/blob/master/vfx/README.md "Vfx Readme"
[readme-md]: ../../README.md "Flannel Readme"
