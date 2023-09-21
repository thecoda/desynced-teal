# desynced-teal

## Initial setup:

Check out into a directory under `Desynced`, in the same place as mods

e.g.

`C:/Program Files (x86)/Steam/steamapps/common/Desynced/Desynced/Content/teal-mods`

Install luarocks: https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Windows

install teal and cyan:

    luarocks install teal
    luarocks install cyan

## Development

Any mods then go into `src/<modname>`

To transpile to lua, run `tl build` in the `teal-mods` directory.  It'll output the lua to `build/<modname>`

## Todo

Extend the build with a script to also copy `def.json` files, and to then copy build files into the mods folder.  I run on MacOS and symlink this, which is not so trivial on windows.