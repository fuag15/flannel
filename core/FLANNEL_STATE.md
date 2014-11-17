# [Flannel][readme-md] - FLANNEL_STATE *( Environment State Snapshot )*

This is a simple state path-like variable, at any time it represents the state of plaid in  your system.

Lets dive into the code! Man, were always diving.. lets glide into the code.

---

### `FLANNEL_STATE` *environment variable*

This variable just maintains the state of our plaid, it's main use is to allow logic to be done on module requirements such as version checking.

### Syntax

`:<module>;*`

You've seen it before, and you'll see it again, why not, its a fine syntax for path like variables. *( Provided they are never used as a path )*

---

### `_flannel_core_update_state` *<module> [clear]*

This function takes a module and adds it to our state if it isn't already there!

If we get a clear, we remove the module from the state. simple eh?

It is run in flannel and maintains `FLANNEL_STATE`.

---

If you haven't checked it out already you should go take a look at [breadcrumbs][breadcrumb-md] the circular dependency handler.

[breadcrumb-md]: BREAD_CRUMBS.md "Breadcrum Markdown Page"
[readme-md]: ../README.md "Flannel Readme"