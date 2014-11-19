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

Voila! Now, if you were clever, you noticed some magic there. When we set maya_plugins to 0.1 and it switched maya over to 2012, it knew to change vray to version 1.6.10 in order to support maya 2012! This is because we are using [reverse_dependencies][reverse_dependencies-readme] reverse dependencies with the optional `fix_reverse_dependencies` to choose a default substitution if we break the dependency!

What if you want it to just clear vray? thats fine! if vray isn't loaded it will not try to fix what isn't broken.

Another route open to you is to not supply a substitute so that when something changes it just removes the broken deps. This is how python and maya are set up currently. Lets take a look at an example.

---

In this example we set `vfx/maya` to default *( 2013 )* which requires `vfx/python/2.7` then we change to `vfx/python/2.6` which would break maya! But, maya is leaving a revdep so we remove it! Next we set `vfx/maya/2012` and clear `vfx/python` which also removes maya! Lets keep things clean guys or you'll have dirty flannel all over the place! *( no one likes dirty flannel )*

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

So, support has been added for relational logic! on requirements as well as relational logic on reverse dependencies and defaults. Lets look at a small sample of some of this. The supported comparators are `>=`, `<=`, `==`

---

In this exaple we have specified some relational logic on the defaults. Namely, Maya 2013 requires vray >= 1.8.34 and vray 1.9.02 requires maya >= 2013. Let's see this in action

Here we set vray which defaults to 1.8.34 and requires maya >= 2013, it finds no Maya set and sets 2013. We then change maya to 2012 which breaks vray 1.8.34 but by default replaces it with vray 1.6.10 if it is set. Then we swithc maya to 2013 which default sets vray to 1.8.34. Then we switch vray to 1.9.02 which requires maya >= 2013. Then we swithc maya to 2014 and switch it back to 2013. Note that vray stays at 1.9.02 since 2013 defaults vray to >= 1.8.34 if it was previously set.

Finally we clear maya which breaks all backwards dependencies but leaves python as is. Then we set vray to 1.9.02 which defaults to maya 2014.

Then we clear python to get rid of our python setting which breaks all backwards dependencies.

Here it goes.

    vest vfx/vray
    echo $PYTHONPATH # /vray/1.8.34:/2.7:/maya/2013:/plugin/0.6

    vest vfx/maya/2012
    echo $PYTHONPATH # /plugin/0.1:/2.6:/vray/1.6.10:/maya/2012

    vest vfx/maya/2013
    echo $PYTHONPATH # /2.7:/vray/1.8.34:/maya/2013:/plugin/0.6

    vest vfx/vray/1.9.02
    echo $PYTHONPATH # /vray/1.9.02:/2.7:/maya/2013:/plugin/0.6

    vest vfx/maya/2014
    echo $PYTHONPATH # /vray/1.9.02:/2.7:/maya/2014:/plugin/0.9

    vest vfx/maya/2013
    echo $PYTHONPATH # /vray/1.9.02:/2.7:/maya/2013:/plugin/0.6

    vest vfx/maya clear
    echo $PYTHONPATH # /2.7

    vest vfx/vray/1.9.02
    echo $PYTHONPATH # /vray/1.9.02:/2.7:/maya/2014:/plugin/0.9

    vest vfx/python clear
    echo $PYTHONPATH # <blank>

Am I a wizard? Yes. Am I modest? ... Yes. ;) The logic for these things could be cleaned up and simplified to make a better front facing format for config files and unit tests for the features are incoming, but I'm dropping further polish, a packaging / distribution system, or a Windows power shell version until external interest is shown in this project.

## example config flannel

Lets look at the hairiest of the hairy!, here's our maya 2013 config.

You'll notice we pass `"${@:(-1)}"`, our input along so that if we get passed `clear` we undo our path modifications. This will most likely be simplified for later versions.

    # set up
    load_modules "flannelpather" "flannelreverse_dependencies" "flannelrequires"

    # reverse_dependencies with replacement defaults
    fix_reverse_dependencies "vfx/maya" "vfx/vray" ">=" "1.8.34" "${@:(-1)}"

    # clear not us
    clear_modules "vfx/maya" "2013" "${@:(-1)}"

    # reverse_dependencies
    remove_broken_reverse_dependencies "vfx/maya" "${@:(-1)}"

    # needs
    load_requirement "vfx/python" "==" "2.7" "${@:(-1)}"

    # lay reverse_dependencies
    define_reverse_dependency "vfx/python" "==" "2.7" "vfx/maya/2013" "${@:(-1)}"

    # does
    create_path "MAYA_PLUGIN_DIR" "/2013" "${@:(-1)}"
    append_path "PYTHONPATH" "/maya/2013" "${@:(-1)}"

    # example of a tightly bound dependency
    flannel "vfx/maya_plugins/0.6" "${@:(-1)}"

## Known Limitations

No other technical ones, support has been added for bounded requirement logic. lookin at @odgrim to break it more. These should all be tested with unit tests and configuration is pretty complex, should provide pretty easy front facing configuration functions.

Check out the [Road Map][road-map-md] markdown for what's up next.

[semver-site]: http://semver.org "Semantic Version System"
[reverse_dependencies-readme]: ../reverse_dependencies/README.md "reverse_dependencies readme"
[road-map-md]: ../ROAD_MAP.md "Road Map Markdown Page"
[vfx-scenario-md]: SCENARIO.md "Vfx Prototype Scenario"
[readme-md]: ../README.md "Flannel Readme"
