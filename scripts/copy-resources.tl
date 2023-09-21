local fs <const> = require("cyan.fs")
local log <const> = require("cyan.log")
local ansi <const> = require("cyan.ansi")
local cs <const> = require("cyan.colorstring")

local info <const> = log.create_logger(
   io.stdout,
   "normal",
   cs.highlight({ansi.color.dark.cyan}, "copy-resources"),
   cs.highlight({ansi.color.dark.cyan}, "...")
)

local function copyBinaryFile(old_path: string, new_path: string): boolean
    local old_file = io.open(old_path, "rb")
    local new_file = io.open(new_path, "wb")
    local old_file_sz, new_file_sz = 0, 0
    if not old_file or not new_file then
      return false
    end
    while true do
      local block = old_file:read(2^13)
      if not block then 
        old_file_sz = old_file:seek( "end" )
        break
      end
      new_file:write(block)
    end
    old_file:close()
    new_file_sz = new_file:seek( "end" )
    new_file:close()
    return new_file_sz == old_file_sz
end

local function copyDirectory(source: string, target: string): boolean
    for f in fs.scan_dir(source, {"**/*"}) do
        local _, ext = fs.extension_split(f)
        if ext ~= ".tl" then
            local source_file = fs.path.new(source)
            source_file:append(f)
            local target_file = fs.path.new(target)
            target_file:append(f)
            target_file:mk_parent_dirs()
            copyBinaryFile(source_file:tostring(), target_file:tostring())
            info("Copying ", cs.highlight(cs.colors.file, source_file:tostring()))
        end
    end
end

copyDirectory("build/lua", "build/target")
copyDirectory("src/resources", "build/target")
