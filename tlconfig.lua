return {
   build_dir = "build/lua",
   source_dir = "src/teal",
   global_env_def = "desynced-declarations",
   scripts = {
      build = {
         post = { "scripts/copy-resources.tl" }
      }
   }
}