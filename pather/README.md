# [Flannel][readme-md] - Pather *( Path Variable Module )*

This module helps us *( mainly for vfx )* with managing path variables!

It provides some simple front end helper functions to do the mostly correct thing with paths!

These functions all can be reversed via passing clear as the last argument to them.

## Code Overview

Lets just dive in, fairly straight forward functions. A good thing to note is that the `<pathname>` variable is the name of the path not the variable itself. 

Keep in mind that passing these globs is cool and all, but it breaks the ability to reverse the change sanely, so if you use it in your module, keep that in mind and write another way to undo your change!

### `in_path` *<pathname> <glob to check for> [clear]*

This is a simple check function, it returns truthy if the glob exists in our path. It's careful about edge cases for you

### `create_path` *<pathname> <glob to check for> [clear]*

This creates the path if it does not exist, if it does exist it `prepend_path`s the glob. Upon reverse it removes the glob match from our path.

### `remove_path` *<pathname>*

This simply unset's the path, you should use this if you are going to unset as I might change the default behavior to comply with expectations. However, chances are, you really ought to use `remove_from_path` instead. This function has no default reversal

### `remove_from_path` *<pathname> <glob to remove> [clear]*

Removes the glob from the path, is smart about edge cases. On a `clear` request it appends the glob to the path.

### `replace_in_path` *<pathname> <glob to find> <replacement> [clear]*

Searches path for the glob, replaces if it is there. If the *glob to find* is not found it `append_path`s the *replacement*.

On a `clear` this function reverses *glob to find* and *replacement*s roles.

### `append_path` *<pathname> <path to append> [clear]*

If *path to append* exists, this function removes it and re-appends. If it does not exist, it simply appends it. On a clear it `remove_from_path`s the *path to append*

### `prepend_path` *<pathname> <path to prepend> [clear]*

Exactly what `append_path` does but instead of re-appending it it re-prepends it!

Hope that helped :)

[readme-md]: ../README.md "Flannel Readme"