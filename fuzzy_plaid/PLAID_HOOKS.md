# [Flannel][readme-md] - Plaid Hooks *( Extend Flannel )*

Hooks are a prototype for allowing extending of flannel without messing with the core. Flannel should eventually source from fuzzy_plaid then contrib then local in order to allow full overriding of the fuzzy_plaid core but that is hopefully a last resort.

With hooks you can get access to the `flannel` loader and its parameters pre and post glob. Go wild.

Heres an overview

---

### `PLAID_PRE_HOOKS` *environment varialbe*
  
Contains a list of functions to run separated by spaces

### Syntax

:function::function2::function3:

---

### `PLAID_POST_HOOKS` *environment varialbe*
  
Contains a list of functions to run separated by spaces

### Syntax

:function::function2::function3:

---

### `plaid pre hook` *hook / unhook pre*

### Syntax

`flannel_pre_hook` <function_name> [clear]

### Pseudo Code

- if clear
  - remove it
  - return
- if not in hooks
  - append it

---

### `plaid post hook` *hook /unhook post*

### Syntax

`flannel_post_hook` <function_name> [clear]

### Pseudo Code

- if clear
  - remove it
  - return
- if not in hooks
  - append it

---

### `plaid hook dismantle` *clear our hooks*

### Syntax

`flannel_unhook_hooks` [{pre,post}]

### Pseudo Code

- if pre
  - unset pre
- elif post
  - unset post
- else
  - unset both

---

This is a pretty questionable feature, don't use it unless its the last resort, will more likely be removed in future versions than expanded.

[readme-md]: ../README.md "Flannel Readme"