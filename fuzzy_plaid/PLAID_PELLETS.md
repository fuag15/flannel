# [Flannel][readme-md] - Plaid Pellets *( State and Reverse Dep Check )*

This is a spec sheet for `PLAID_PELLETS` feature prototype.

**[children can find their immediate parent, parents list only immediate children]**

If this is not 'performant' enough it could be broken down more but prefer to keep the env clean.

Also of note, this is designed as hooks to `flannel` if that is not 'performant' enough it could be added to specific module configuration but prefer to keep writing of modules easy.

## `PLAID_PELLETS` *environment state / dependency variable*

The point of this is to maintain the state of flannel as well as provide hooks for reverse dependencies. 

---

### Syntax

`<module>'<args>'[<depend>:*]:*`

## `pellet` *leave a pellet dependency*

This is designed to modify `PLAID_PELLETS` in a smart / easy way.

---

### Syntax

`pellet <module> [args] needs [<module>'args'] [clear]`

Where <module>'args' can be a glob, might default to it being treated as a prefix, not a glob to simplify writing modules

---

### Pseudo Code

1. format <module> [args] to <module>'args'
  - do this in a helper function?
  - do this in .flannel?
2. if it's a clear remove `<module>'args'[<module'args':*]:` from path and `return`
3. else if `<module>'args'[` is in the path. `return` there is never a case where [] will be different from the same call
4. else, add it to the path!
 
---

### Changes in other functions

- `flannel` will now default leave a pellet during `bread_crumbs`
- if `flannel` gets a clear it will pass it to `pellet` to clear the `pellet`

## `lint_pellets` *check for reverse dependencies*

This is designed to be called when flannel is called with a `clear`. It will scan our `PLAID_PELLETS` for any modules referencing the module to be removed that match the argument.

---

### Syntax

`lint_pellets <module> [clear]`

where *<module>* is the current module

---

### Pseudo Code

1. if we did not get a `clear`, `return`
2. search `PLAID_PELLETS` for <pmodule>[<module>'options':]
3. `flannel` <module>'options' clear

**should lint_pellets first thing during module init to prevent removing shared children deps**

---

### Changes in other functions

- `flannel` lints pellets before loading a modules `init.flannel`
  - Consider making this part of a modules `init`
  - prefer not, to keep writing modules simple

## `lint_pellet` *check for a pellet and provide a default substitution*

This is meant to be done at the top of an `init.flannel`, it checks if a specific reverse dependency is currently active and if so provides a default replacement that plays nicely. This only gets run if there is a `clear` flag

**caution! behavior not based on clear seems strange and bad**

**Note this means `lint_pellets` should be done in a .flannel as should `pellet` and `pellet` should ignore its clear, maybe add syntax for providing defaults during pellet laying? bad idea, assumes intent is to maintain state when switching**

---

### Syntax

`lint_pellet <your module> <module glob to find> <substitution> [clear]`

where *<module glob to find>* is the Dependant to find and *<substitution>* is the module to replace it with

---

### Pseudo Code

1. if we didn't get `clear`, `return`
2. search `PLAID_PELLETS` for the right thing, remove it and then replace it with our replacement!

---

### Changes in other functions

- None, but could possibly need a `clean_table` or a different table state, like `USED_FLANNEL` but be careful with this, it stinks of not true and bad

## Reflection

Looks good aside from the note below, re-check after next iteration

**simplier to have dependies just be one per pellet, this change is assumed in the spec for lint pellet!, this change is coupled with the note below**

**Note, probably better / more natural to native BASH globbing to have it be <dependant>[dependies] modify this to reflect that, also throw out options of dependies to simplify for now, maybe even options of dependants, cosider it**

**Seperate Enough to be it's own module?**

[readme-md]: ../README.md "Flannel Readme"