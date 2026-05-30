local mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.deps"

if not vim.loop.fs_stat(mini_path) then
   vim.cmd.echo('"Cloning mini.deps..."')
   local git_clone_stdout = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/nvim-mini/mini.deps",
      mini_path,
   })

   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { "Failed to clone mini.deps:\n", "ErrorMsg" },
         { git_clone_stdout, "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})

      vim.fn.getchar()
      os.exit(1)
   end

   vim.cmd.echo('"mini.deps cloned successfully!"')
end

vim.opt.rtp:prepend(mini_path)
return require("mini.deps")
