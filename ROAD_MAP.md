# [Flannel][readme-md] - Road Map

- add `requires` the version logic module and use it in vfx see [spec][requires-md]
- tidy up code / functions (move remove all as another function that's smart and only removes if the configuration is present)
- move flannel int fuzzy_plaid? just source init.flannel
- make test convention (module/test)
- set set up versions
- Organize for distribution, make loading precidence to allow for overriding of default modules without modifying source *( most likely lib, dist, contrib model )*
- Set up central distribution / version file and module version files
- Make `thrift` the sharing / distribution module, pulls from here
- curl based one liner
- auto update your bashrc for progams that will launch
- Stabilize
- make verbose
- add hooks to `flannel`? possibly bad idea, list of functions to run before, after load and before, after glob
- beautify with an image / icon for this repo
- Enjoy

[requires-md]: requires/README.md "Requires Spec Markdown"
[readme-md]: README.md "Flannel Readme"