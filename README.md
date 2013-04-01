# Flannel - Bash Looks Better in Plaid

This is a modular bash framework for sharing common scripts between your friends and fellow coders!

This is opinionated code! Chances are if what your doing doesn't fit in here, you can easily re factor it to play nice.

This is just a beginning of a project, note that we haven't reached beta yet, we haven't even reached a version number! This will use [semantic versions][semantic-versioning-org] with tagged releases when we get there. Nothing revolutionary should change to the usage API but I'm making no promises yet!

There is also a proof of concept environment variable manager for visual effects inspired by @odgrim. @odgrim did the ground work on auto completion and prompt as well as inspired this whole project / provided the specs and use cases for environment manager proof of concept.

## Manifesto

- If you do it twice, automate it
- Nice code is nice, automation is nicer, make pretty a secondary concern, improve over time, share lots. :)

## Installation

OSX: *( one liner sources in bash_profile )*

    git clone git@github.com:fuag15/flannel ~/.flannel.git && echo "[[ -f ~/.flannel/init.sh ]] && . ~/.flannel/init.sh fuzzy_plaid >> ~/.bash_profile && . ~/.bash_profile"


Unix/Linux: *( one liner sources in bashrc )*

    git clone git@github.com:fuag15/flannel ~/.flannel.git && echo "[[ -f ~/.flannel/init.sh ]] && . ~/.flannel/init.sh fuzzy_plaid >> ~/.bashrc && . ~/.bashrc"

Windows: *( look into power shell? glhf )*

    You clicked a bad link. Go [here][msdn]

## Basic Usage

Once Installed the important functions are `vest`: *load a module* and `jacket`: load default config, named config, local configs.

Vest currently supports a form of auto complete.

`vest`: *vest module_path_glob [options]*

    vest prompt
    vest vfx/maya/2013
    vest vfx/maya/2013 clear

`jacket`: *jacket [named config]*

    jacket # will reload ~/.flannelrc and any ./.plaid_patch files
    jacket work # will reload ~/.flannelrc then  ~/.work.flannelrc then any ./.plaid_patch files

## More Documentation / References

- [Roadmap][roadmap-md] where are we going
- [Developers][developers-md] how do I write code for this
- [Contributing][contributing-md] how can I help
- [Change Log][changelog-md] What has changed
- [Breaking Changes][breaking-changes-md] What did you break? Why?
- [Legal / Licensingg][legal-licensing-md] I'd like to use this for work or profit or play, how do I play nice?

[msdn]: http://msdn.microsoft.com/en-us/ "Microsoft Developer Network"
[semantic-versioning-org]: http://semver.org/ "Semantic Versioning Overview"
[roadmap-md]: ROADMAP.md "Road Map Markdown"
[developers-md]: DEVELOPERS.md "Developers Markdown"
[contributing-md]: CONTRIBUTING.md "Contributing Markdown"
[changelog-md]: "CHANGELOG.md" "Changelog Markdown"
[breaking-changes-md]: "BREAKING_CHANGES.md" "Breaking Changes Markdown"
[legal-licensign-md]: "LEGAL_LICENSING.md" "Legal and Licensing information"
