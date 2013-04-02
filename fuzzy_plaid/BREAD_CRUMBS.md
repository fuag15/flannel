# [Flannel][readme-md] - Bread Crumbs *( Circular Dep Check )*

Flannel uses bread crumbing to prevent circular dependencies in modules. This was initially designed to be a variable passed along by the `flannel` function but got extracted to an env var called `FLANNEL_CRUMBS` in order to simplify the use of `flannel`

Each module load, `flannel` writes `<module name>'<args passed>':` To `FLANNEL_CRUMBS`, if it finds that there is already a crumb matching this call to the module it skips the module load. This breaks circular dependencies while allowing for multiple calls to the same module with different arguments :) 

Any new `vest` call or `jacket` call clears this list before it runs, this allows us to change our module set up multiple times per shell with the same results per run *( ideally )*

As a convention modules in flannel are expected to take `clear` as their last argument, if they receive it, the module undoes whatever was done.

## Code Overview

`clean table` *clean table*
  
  Simply unset's our FLANNEL_CRUMBS environment variable.

`module crumbs` *module_crumbs <crumb>*
  
  First this function checks if we already ate this module with these parameters, if so it returns 0 to tell `flannel` that it should skip the module

  If not it appends to `FLANNEL_CRUMBS` in a dumb path like way *( simpler to parse than paths, this is never used as a path )* `<modulename>'<args>':`

[readme-md]: ../README.md "Flannel Readme"