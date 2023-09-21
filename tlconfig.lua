return {
   build_dir = "lua-files",
   source_dir = "src",
   global_env_def = "desynced-declarations",
   scripts = {
      build = {
         post = { "scripts/copy-resources.tl" }
      }
   }
}