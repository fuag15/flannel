# [Flannel][readme-md] - Plaid Pellets *( Reverse Dep Check )*

In flannel we use pellets to handle reverse dependencies. If you rely on a child that might change, add a pellet to tell flannel! Pellets take the form of `<module_you_need>[<your_module>]` so that when the module you need changes, it can destroy you :)

Note this might change to `''` instead of `[]` if globing support is added in the future but this should not affect anything front facing.

when a module is unloaded it `lint_pellets` and clears any modules that rely on it it might have broken by changing!

If you don't like the idea of getting deleted automatically, the module can use `lint_pellet` to look for a specific dep that might be breaking and substitute another default for it.

The easiest way to see how this works is by looking at the [vfx][vfx-readme] module which uses it.

Lets dive into the code!

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

---

### `lint_pellets` *check for reverse dependencies*

This is designed to be called when flannel is called with a `clear`. It will scan our `PLAID_PELLETS` for any modules referencing the module to be removed that match the argument.

Called first thing in a config

### Syntax

`lint_pellets <module> [clear]`

where *<module>* is the current module

---

### `lint_pellet` *check for a pellet and provide a default substitution*

This is meant to be done at the top of an `init.flannel`, it checks if a specific reverse dependency is currently active and if so provides a default replacement that plays nicely. This only gets run if there is a `clear` flag. Should be called right before lint_pellets

### Syntax

`lint_pellet <module> <rdepend> <substitution> [clear]`

where *<module glob to find>* is the Dependant to find and *<substitution>* is the module to replace it with

[vfx-readme]: ../vfx/README.md "Vfx Prototype Module"
[readme-md]: ../README.md "Flannel Readme"