# [Flannel][readme-md] - Flannel Crumbs *( Circular Dep Check )*

Flannel uses bread crumbing to prevent circular dependencies in modules. This was initially designed to be a variable passed along by the `flannel` function but got extracted to an env var called `FLANNEL_REVERSE_DEPENDENCIES` in order to simplify the use of `flannel`

Each module load, `flannel` writes `<module name>'<args passed>':` To `FLANNEL_REVERSE_DEPENDENCIES`, if it finds that there is already a crumb matching this call to the module it skips the module load. This breaks circular dependencies while allowing for multiple calls to the same module with different arguments :) 


As a convention modules in flannel are expected to take `clear` as their last argument, if they receive it, the module undoes whatever was done.

Lets walk through the code

---

### `_flannel_core_clear_reverse_dependencies` *clear crumbs*
  
Simply unset's our FLANNEL_REVERSE_DEPENDENCIES environment variable.

---

### `module crumbs` *module_crumbs <crumb>*
  
First this function checks if we already ate this module with these parameters, if so it returns 0 to tell `flannel` that it should skip the module

If not it appends to `FLANNEL_REVERSE_DEPENDENCIES` in a dumb path like way *( simpler to parse than paths, this is never used as a path )* `<modulename>'<args>':`

---

If you haven't looked already, the last part to this module loader module is [flannel state][flannel-state-md] the state snapshot.

[flannel-state-md]: FLANNEL_STATE.md "Flannel State Markdown"
[readme-md]: ../README.md "Flannel Readme"
