# [Flannel][readme-md] - Vfx Scenario *( Vfx Env Management Prototype Spec )*

This is a quick reference of the spec used to build the [vfx prototype module][vfx-md]. Spec was provided by @odgrim and he has helped poke many holes in my iterations of implementing it.

## Python

Mimics a system with multiple python versions

- Sets `PYTHONPATH` to point to version

### supplies

- 2.6
- 2.7

### defaults

- 2.7

## Maya

Manages Maya environment variables

- Sets `MAYA_PLUGIN_DIR`
- Appends `PYTHONPATH`

### needs

- python

### supplies

- 2012
  - needs `python` 2.6
  - sets `maya_plugins` 0.1
- 2013
  - needs `python` 2.7
  - sets `maya_plugins` 0.6
- 2014
  - needs `python` 2.7
  - sets `maya_plugins` 0.9

### defaults

- 2013

## Maya Plugins

Meant to mimic third party plug-ins that need different versions

- prepends `PYTHONPATH`
- prepends `MAYA_PLUGIN_PATH`

### needs

- `maya`

### supplies

- 0.1
  - needs `maya` 2012
- 0.6
  - needs `maya` 2013
- 0.9
  - needs `maya` 2014

### defaults

- 0.6

## Vray

Mimics vray for different versions of maya.

- sets version specific env vars
- prepends `PYTHONPATH`
- needs `maya`

### supplies

- 1.6.10
  - needs `maya` 2012
- 1.8.34
  - needs `maya` 2013
- 1.9.02
  - nees `maya` >= 2013

### defaults

- 1.8.34

[vfx-md]: README.md "Vfx Prototype Scenario"
[readme-md]: ../README.md "Flannel Readme"