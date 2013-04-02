# [Flannel][readme-md] - Fuzzy Plaid *( Core Module )*

This is the main module for Flannel. It contains some helper functions for things such as loading a module `vest`, loading modules based on a default configuration `~/.flannelrc` or named configurations `~/.name.flannelrc` or directory configurations `./.plaid_patch` - `jacket`

## Code Overview

Let's look at how these functions work from the inside-out.

### `wear` *wear <stdin>*

This function expects standard input in the form of one run of `flannel` *( load a module with args )* per line.

This is perfect for reading in from config files!

### `build closet` *build_closet [list of modules]*

This function expects a list of module names to load then simply passes that list off to `flannel`, this makes it perfect for loading things like module dependencies etc

### `jacket` *jacket* [named config]

This function looks in `~/.flannelrc` to see if it's there, if it is, it `wear`s it, then if you pass a name it looks for a special `~/.name.flannelrc` config and if it finds one it `wear`s that. Finally, it loads any directory specific `./.plaid_patch`'s from the current directory and `wear`s them.

This function also clears the table of any breadcrumbs before running. For more on breadcrumbs see the [breadcrumb][breadcrumb-md] markdown.

### `vest` *vest* module_name [module flags]
  
This function appears to be pretty similar to `flannel` however you'll notice that it clears crumbs from our table before running. For more on how flannel uses breadcrumbs see the [breadcrumb][breadcrumb-md] markdown.

Looks like this is a good time to read more about [breadcrumbs][breadcrumb-md]. Hungry?, eat a cookie, bread's pretty bland.

[breadcrumb-md]: BREAD_CRUMBS.md "Breadcrum Markdown Page"
[readme-md]: ../README.md "Flannel Readme"