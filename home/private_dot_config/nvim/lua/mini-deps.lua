local M = {}

function M.setup()
   local mini_path = vim.fn.stdpath("data") .. "site/pack/deps/start/mini.deps"

   if vim.loop.fs_stat(mini_path) then
      return
   end

   vim.cmd.echo("Cloning mini.deps...")
   local git_clone_stdout = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/nvim-mini/mini.deps",
      mini_path,
   })

   if vim.v.shell_error ~= 0 then
      vim.cmd.echo(
         "Failed to clone mini.deps:\n"
            .. git_clone_stdout
            .. "\nPress any key to exit..."
      )

      vim.fn.getchar()
      os.exit(1)
   end

   vim.cmd.echo("mini.deps cloned successfully!")
   vim.opt.rtp:prepend(mini_path)
end

return M
