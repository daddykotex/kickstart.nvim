return {
  "mfussenegger/nvim-lint",
  -- dir = "~/workspace/dev/nvim-lint",
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      sh = { 'shellcheck', }
    }
    local nvim_lint_group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
      group = nvim_lint_group,
    })
  end
}
