local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
   formatting.prettier,
   formatting.stylua,

   lint.shellcheck,
}

null_ls.setup {
   debug = true,
   sources = sources,
}
