# [Flannel][readme-md] - Vfx *( Vfx Env Management Prototype Module )*

This is a prototype inspired by @odgrim. Visual effects studios end up juggling a lot of environment variables for different versions of plug-ins for different programs. This is a prototype adaptation for the scenario described in the [scenario][vfx-scenario-md] markdown.

So far this handles circular deps and clear and setting states.

## Example

Here is an example run. We set maya 2012 which sets python to be 2.6 then we set vray which defaults to 1.8.34 which requires maya 2013 which requires python 2.7. We then set maya_plugins 0.1 which requires maya 2012. Finally we clear maya. Note that maya default sets maya_plugins and maya_plugins requires maya, A circular dependency!

@odgrim inquired about disabling default sets, I would suggest getting this done by parsing a flag in the maya `init.flannel`.

Here we go!

    $ echo "$MAYA_PLUGIN_DIR"
    $ vest vfx/maya/2012
    $ echo "$MAYA_PLUGIN_DIR"
    /maya/plugin/2012
    $ echo "$PYTHONPATH"
    /etc/user/python/maya_plugin/0.1:/usr/bin/python/2.7:/usr/bin/python/2.6:/usr/bin/maya/2012/python
    $ vest vfx/vray
    $ echo "$MAYA_PLUGIN_DIR"
    /maya/plugin/2013
    $ echo "$PYTHONPATH"
    /some/python/path/vray/1.8.34:/usr/bin/python/2.7:/usr/bin/maya/2013/python:/etc/user/python/maya_plugin/0.6
    $ vest vfx/maya_plugins/0.1
    $ echo "$MAYA_PLUGIN_DIR"
    /maya/plugin/2012
    $ echo "$PYTHONPATH"
    /etc/user/python/maya_plugin/0.1:/usr/bin/python/2.6:/some/python/path/vray/1.8.34:/usr/bin/maya/2012/python
    $ vest vfx/maya clear
    $ echo "$MAYA_PLUGIN_DIR"

Voila! Now, if you were clever, you noticed a problem with that which is addressed in `Known Limitations` and has a feature planned that will fix it.

## example config flannel

You'll notice we pass `"$@"`, our input along so that if we get passed `clear` we undo our path modifications, and we utilize globs to clear everything that is not us!

    build_closet pather vfx/maya/2013
    flannel "vfx/vray/!(1.8.34)" clear
    create_path VRAY_1_8_34 /some/path/to/vray/1.8.34 "$@"
    prepend_path PYTHONPATH /some/python/path/vray/1.8.34 "$@"

## Known Limitations

Reverse dependencies! If you follow the example scenario above, at one point we switch from Maya 2013 with a Vray version depending on it to Maya 2012, but Vray doesn't get removed, complain, or updated!

Never fear! I have worked up a solution to this that is laid out in the [Road Map][road-map-md] markdown. 

**I noticed some bugs involving my path functions and globing so I took out those features and made the vfx module more dumb. Bugs will be fixed asap and this will be removed!**

[road-map-md]: ../ROAD_MAP.md "Road Map Markdown Page"
[vfx-scenario-md]: SCENARIO.md "Vfx Prototype Scenario"
[readme-md]: ../README.md "Flannel Readme"