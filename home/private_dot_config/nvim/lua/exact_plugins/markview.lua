---@module 'markview'

---@type LazyPluginSpec
return {
   "https://github.com/OXY2DEV/markview.nvim",
   lazy = false,
   ---@type markview.config
   ---@diagnostic disable: missing-fields
   opts = {
      experimental = {
         fancy_comments = true,
         prefer_nvim = true,
      },
      markdown = {
         code_blocks = {
            sign = false,
         },
         headings = {
            heading_1 = { sign = "" },
            heading_2 = { sign = "" },
            setext_1 = { sign = "" },
            setext_2 = { sign = "" },
         },
      },
      markdown_inline = {
         inline_codes = {
            -- Remove the padding around `` enclosed text.
            padding_left = "",
            padding_right = "",
         },
      },
   },
   ---@diagnostic enable: missing-fields
}
