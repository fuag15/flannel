# [Flannel][readme-md] - Plaid Pellets *( State and Reverse Dep Check )*

This is a spec sheet for `PLAID_PELLETS` feature prototype.

**children can find their immediate parent, parents list only immediate children**

If this is not 'performant' enough it could be broken down more but prefer to keep the env clean.

Also of note, this is designed as hooks to `flannel` if that is not 'performant' enough it could be added to specific module configuration but prefer to keep writing of modules easy.

---

### `PLAID_PELLETS` *environment state / dependency variable*

The point of this is to maintain the state of flannel as well as provide hooks for reverse dependencies. 

### Syntax

`:<module>[<rdepend>]*`

---

### `pellet` *leave a pellet dependency*

This is designed to modify `PLAID_PELLETS` in a smart / easy way.

### Syntax

`pellet <module> <rdepend> [clear]`

Where <module>'args' can be a glob, might default to it being treated as a prefix, not a glob to simplify writing modules. Should be left in module config. note, you could pass args here to be more specific. can modify to allow for globbing

### Pseudo Code

1. if it's a clear remove `<module>[<rdepend>]:` from path and `return`
2. else if `<module>[<rdepend>]` is in the path. `return`
3. else, add it to the path!

---

### `lint_pellets` *check for reverse dependencies*

This is designed to be called when flannel is called with a `clear`. It will scan our `PLAID_PELLETS` for any modules referencing the module to be removed that match the argument.

Called first thing in a config

### Syntax

`lint_pellets <module> [clear]`

where *<module>* is the current module

### Pseudo Code

1. if we did not get a `clear`, `return`
2. search `PLAID_PELLETS` for <module>[<rdepend>]
3. `flannel` <module> clear

---

### `lint_pellet` *check for a pellet and provide a default substitution*

This is meant to be done at the top of an `init.flannel`, it checks if a specific reverse dependency is currently active and if so provides a default replacement that plays nicely. This only gets run if there is a `clear` flag. Should be called right before lint_pellets

### Syntax

`lint_pellet <module> <rdepend> <substitution> [clear]`

where *<module glob to find>* is the Dependant to find and *<substitution>* is the module to replace it with

### Pseudo Code

1. if we didn't get `clear`, `return`
2. search `PLAID_PELLETS` for the right thing, remove it and then replace it with our replacement!

[readme-md]: ../README.md "Flannel Readme"