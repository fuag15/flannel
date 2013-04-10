# [Flannel][readme-md] - Plaid Sheep *( Spool Queue )*

The `PLAID_SHEEP` environment variable is a path like variable that is meant to store flannel modules that are currently processing. It is used in conjunction with the `requires` module and `pellets` module to resolve logical reverse dependencies. This could easily be done using the `crumbs` module but I have separated it out for simplicity during early development, could be merged in the future.

This doc will need to be flushed out, however for now here is some code dumping. Overview is we place sheep in the line and stitch them after we have applied them and then in-between run we disperse any leftovers in-case something bad happened.

---

### `PLAID_SHEEP` *environment variable for currently flanneling modules*

This will contain the same path like syntax as other such variables and is very much like the `BREAD_CRUMBS` environment variable except that it only keeps track of what is about to be applied, not removed, and it does not care about parameters passed

### Syntax

`:module;*`

---

### `place` *line up some sheep to flannel*

This function adds the sheep to the line if it isn't already in it.
If this is a clear request it ignores

### Syntax

`place` *module [clear]*

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

This is meant to be called whenevr we clear crumbs. It clears any sheep left in `PLAID_SHEEP`

### Syntax

`disperse`

### Pseudo code

unset `PLAID_SHEEP`

---

there ya have it, `PLAID_SHEEP`

[readme-md]: ../README.md "Flannel Readme"
