# [Flannel][readme-md] - Plaid Spool *( Spool Queue )*

The `FLANNEL_SPOOL` environment variable is a path like variable that is meant to store flannel modules that are currently processing. It is used in conjunction with the `requires` module and `reverse_dependencies` module to resolve logical reverse dependencies. This could easily be done using the `crumbs` module but I have separated it out for simplicity during early development, could be merged in the future.

This doc will need to be flushed out, however for now here is some code dumping. Overview is we _flannel_core_spool_add modules in the FLANNEL_SPOOL and _flannel_core_spool_remove them after we have applied them and then in-between run we _flannel_core_clear_spool any leftovers in-case something bad happened.

---

### `FLANNEL_SPOOL` *environment variable for currently flanneling modules*

This will contain the same path like syntax as other such variables and is very much like the `BREAD_CRUMBS` environment variable except that it only keeps track of what is about to be applied, not removed, and it does not care about parameters passed

### Syntax

`:module;*`

---

### `place` *line up some sheep to flannel*

This function adds the sheep to the line if it isn't already in it.
If this is a clear request it ignores

### Syntax

`_flannel_core_spool_add` *module [clear]*

### Pseudo Code

1. if we got a clear, ignore
2. else if its not in the path
  - place it in the path

---

### `stitch` *clear a sheep from the line up*

this removes a module from the sheep line up

### Syntax

`stitch` *module [clear]*
[readme-md]: README.md "Flannel Readme"

### Pseudo code

1. If we got a clear, return
2. else remove from path

---

### `disperse` *Remove any awaiting sheep*

This is meant to be called whenevr we clear crumbs. It clears any sheep left in `FLANNEL_SPOOL`

### Syntax

`disperse`

### Pseudo code

unset `FLANNEL_SPOOL`

---

there ya have it, `FLANNEL_SPOOL`

[readme-md]: ../README.md "Flannel Readme"
