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

`:<module>;{>=,==,>=};version[<rdepend>]*`

---

### `pellet` *leave a pellet dependency*

This is designed to modify `PLAID_PELLETS` in a smart / easy way.

### Syntax

`pellet <module> <operator> <version> <rdepend> [clear]`

Where <module> is the base module you need, operator is one of {==,>=,<=} and <version> is the version you rely on in relation to that operator. <rdepend> is the full module path to yourself

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

`lint_pellet <module> <rdepend> <operator> <version> [default clear]`

where <module> is the module base you are linting for, <rdepend> is the base of the reverse dependency, and <operator> / <version> are a logical pair for what you want the replacement dependency to be.

[vfx-readme]: ../vfx/README.md "Vfx Prototype Module"
[readme-md]: ../README.md "Flannel Readme"