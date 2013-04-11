# [Flannel][readme-md] - Road Map

- Organize for distribution, make loading precidence to allow for overriding of default modules without modifying source *( most likely lib, dist, contrib model )*
- set up packaging
- bounded requirement and pellet logic
- add hooks to `flannel`? possibly bad idea, list of functions to run before, after load and before, after glob
- Make `thrift` the sharing / distribution module, pulls from here
- set set up versioning

[requires-md]: requires/README.md "Requires Spec Markdown"
[readme-md]: README.md "Flannel Readme"