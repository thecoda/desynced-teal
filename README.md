# desynced-teal

## Initial setup:

Check out into a directory under `Desynced`, in the same place as mods

e.g.

`C:/Program Files (x86)/Steam/steamapps/common/Desynced/Desynced/Content/teal-mods`

Install luarocks: https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Windows

install teal and cyan:

    luarocks install tl
    luarocks install cyan

## Development

All your code goes under:
- `src/teal/<modname>` for teal files to be transpiled
- `src/resources/<modname>` for `def.json`, meshes, images, and raw `.lua` files

To transpile to lua, run `./build.sh` in the `teal-mods` directory.  It'll then:
- transpile the teal to lua in `build/lua/<modname>`
- merge the lua files with the resources to `build/target/<modname>`

Once built you can symbolically link the `build/target/<modname>` output folder into the desynced mods folder. For the example "silo" mod the command for this is:

    mklink /D build/target/silo ../mods/silo

Subsequent builds can then be immediately followed by F7 to reload.

Alternately, you can modify the build script to copy the folder once built.