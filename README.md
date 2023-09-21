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

Any mods then go into `src/<modname>`

To transpile to lua, run `./build.sh` in the `teal-mods` directory.  It'll output the lua to `target/<modname>`

Once built you can symbolically link the mod build output folder into the desynced mods folder. For the example "silo" mod the command for this is:

    mklink /D target/silo ../mods/silo
