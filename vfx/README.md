# [Flannel][readme-md] - Vfx *( Vfx Env Management Prototype Module )*

This is a prototype inspired by @odgrim. Visual effects studios end up juggling a lot of environment variables for different versions of plug-ins for different programs. This is a prototype adaptation for the scenario described in the [scenario][vfx-scenario-md] markdown.

So far this handles circular deps and clear and setting states.

## Examples

Here is an example run. We set maya 2012 which sets python to be 2.6 then we set vray which defaults to 1.8.34 which requires maya 2013 which requires python 2.7. We then set maya_plugins 0.1 which requires maya 2012. Finally we clear maya. Note that maya default sets maya_plugins and maya_plugins requires maya, A circular dependency!

@odgrim inquired about disabling default sets, I would suggest getting this done by parsing a flag in the maya `init.flannel`.

Here we go!

    echo $MAYA_PLUGIN_DIR # <blank>

    vest vfx/maya/2012
    echo $MAYA_PLUGIN_DIR # /2012
    echo $PYTHONPATH # /2.6:/maya/2012:/plugin/0.1

    vest vfx/vray
    echo $MAYA_PLUGIN_DIR # /2013
    echo $PYTHONPATH # /vray/1.8.34:/2.7:/maya/2013:/plugin/0.6

    vest vfx/maya_plugins/0.1
    echo $MAYA_PLUGIN_DIR # /2012
    echo $PYTHONPATH # /plugin/0.1:/2.6:/vray/1.6.10:/maya/2012
    
    vest vfx/maya clear
    echo $MAYA_PLUGIN_DIR # <blank>

Voila! Now, if you were clever, you noticed some magic there. When we set maya_plugins to 0.1 and it switched maya over to 2012, it knew to change vray to version 1.6.10 in order to support maya 2012! This is because we are using [pellets][pellets-readme] reverse dependencies with the optional `lint_pellet` to choose a default substitution if we break the dependency!

What if you want it to just clear vray? thats fine! if vray isn't loaded it will not try to fix what isn't broken.

Another route open to you is to not supply a substitute so that when something changes it just removes the broken deps. This is how python and maya are set up currently. Lets take a look at an example.

---

In this example we set `vfx/maya` to default *( 2013 )* which requires `vfx/python/2.7` then we change to `vfx/python/2.6` which would break maya! But, maya is leaving a pellet so we remove it! Next we set `vfx/maya/2012` and clear `vfx/python` which also removes maya! Lets keep things clean guys or you'll have dirty flannel all over the place! *( no one likes dirty flannel )*

    vest vfx/maya
    echo $PYTHONPATH # /2.7:/maya/2013:/plugin/0.6

    vest vfx/python/2.6
    echo $PYTHONPATH # /2.6

    vest vfx/maya/2012
    echo $PYTHONPATH # /plugin/0.1:/2.6:/maya/2012

    vest vfx/python clear
    echo $PYTHONPATH # <empty>

Now.. that @odgrim guy... "what if i set vray to 0.9, then i set maya, I don't want it to switch me to 0.6"

Well, we talked about a block and he had a really cool insight for dealing with versions that are non semantic or uniform! Turns out if you compare versions left to right dumbly as characters, the one with the first character difference thats of higher value is the newer version! Cool beans.

So, incoming in the [road map][road-map-md] is a `requires` module and a `PLAID_SPOOL` environment state variable that together will allow for requiring logical operators on module dependencies! First version is planned to support the standard ones `<=`, `>=`, `==`. In the future it it will have support for a `~=` for [semantic][semver-site] version complaint things

## example config flannel

Lets look at the hairiest of the hairy!, here's our maya 2012 config.

You'll notice we pass `"${@:(-1)}"`, our input along so that if we get passed `clear` we undo our path modifications. This will most likely be simplified for later versions.

    # set up
    build_closet pather pellets

    # pellets with replacement defaults
    lint_pellet vfx/maya/2013 vfx/vray/1.8.34 vfx/vray/1.6.10 "${@:(-1)}"

    # clear not us
    flannel "vfx/maya/!(2012)" clear

    # regular pellets
    lint_pellets vfx/maya/2012 "${@:(-1)}"
    pellet vfx/python/2.6 vfx/maya/2012 "${@:(-1)}"

    # needs
    flannel vfx/python/2.6 "${@:(-1)}"

    # does
    create_path MAYA_PLUGIN_DIR /2012 "${@:(-1)}"
    append_path PYTHONPATH /maya/2012 "${@:(-1)}"
    flannel vfx/maya_plugins/0.1 "${@:(-1)}"

## Known Limitations

Reverse dependencies! If you follow the example scenario above, at one point we switch from Maya 2013 with a Vray version depending on it to Maya 2012, but Vray doesn't get removed, complain, or updated!

Never fear! I have worked up a solution to this that is laid out in the [Road Map][road-map-md] markdown. 

[semver-site]: http://semver.org "Semantic Version System"
[pellets-readme]: ../pellets/README.md "pellets readme"
[road-map-md]: ../ROAD_MAP.md "Road Map Markdown Page"
[vfx-scenario-md]: SCENARIO.md "Vfx Prototype Scenario"
[readme-md]: ../README.md "Flannel Readme"