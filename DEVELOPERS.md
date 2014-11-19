# [Flannel][readme-md] - Developers

This is an overview of the core flannel functionality. There is a pair document in [core][core-readme] *( core library for flannel )* which goes into more detail.

## Functional Overview

We load `flannel` during the source of ~/.flannel/init.sh and we instruct it to load the `core` library.

`flannel` is set up such that you pass it a glob that is the path to a module to load relative to ~/.flannel/

It will then match every module against that glob and source a `.sh` / `.bash` files within. This is where you should put function definitions etc.

Then, iff there is an `init.flannel` in the module directory, it will source it. This is where you should put set up logic like module dependencies or initialization.

`flannel` uses a bread crumb like system to avoid circular dependencies and loads that is bound to the module name and the arguments specified during the call. This crumb system is cleared every call to `jacket` or `vest` *( the front facing functions )*.

note that this organization allows for circular dependencies, and submodules.

Now is when you go to [core][core-readme] to read in more depth :)

[core-readme]: core/README.md "Core Flannel Doc"
[readme-md]: ../README.md "Flannel Readme"
