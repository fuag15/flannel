# [Flannel][readme-md] - Flannel *( Core Module )*

This is the main module for Flannel. It contains some helper functions for things such as loading a module `vest`, loading modules based on a default configuration `~/.flannelrc` or named configurations `~/.name.flannelrc` or directory configurations `./.plaid_patch` - `jacket`

Let's look at how these functions work from the inside-out.

---

### `build closet` *load_modules [list of modules]*

This function expects a list of module names to load then simply passes that list off to `flannel`, this makes it perfect for loading things like module dependencies etc

---

### `jacket` *jacket* [named config]

This function looks in `~/.flannelrc` to see if it's there, if it is, it `wear`s it, then if you pass a name it looks for a special `~/.name.flannelrc` config and if it finds one it `wear`s that. Finally, it loads any directory specific `./.plaid_patch`'s from the current directory and `wear`s them.

This function also clears the table of any reverse dependencies before running. For more on reverse_dependenciess see the [reverse_dependencies][reverse_dependencies-md] markdown.

---

### `vest` *vest* module_name [module flags]
  
This function appears to be pretty similar to `flannel` however you'll notice that it clears crumbs from our table before running. For more on how flannel uses reverse_dependencies see the [reverse_dependencies][flanne-reverse_dependencies-md] markdown.

---

Looks like this is a good time to read more about [reverse_dependenciess][flanne-reverse_dependencies-md].

You might want to check out [flannel state][flannel-state-md] the state snapshot.

Or if your hungry for meat, maybe [flannel spool][flannel-spool-md]

[flannel-spool-md]: FLANNEL_SPOOL.md "Flannel Spool Markdown"
[flannel-state-md]: FLANNEL_STATE.md "Flannel State Markdown"
[flannel-reverse_dependencies-md]: FLANNEL_REVERSE_DEPENDENCIES.md "Revdeps Markdown Page"
[readme-md]: ../README.md "Flannel Readme"