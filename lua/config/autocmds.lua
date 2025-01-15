-- qmd template
local qmd_template = [[
---
title:
format:
   html:
      code-fold: false
jupyter: python3
---
]]

local function insert_qmd_template()
	local buf = vim.api.nvim_get_current_buf()
	if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
		vim.api.nvim_buf_set_lines(buf, 0, 0, false, vim.split(qmd_template, "\n"))
	end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
	pattern = "*.qmd",
	callback = insert_qmd_template,
})

local new_block_template = [[
```{python}

```
]]

local function insert_new_block()
	local buf = vim.api.nvim_get_current_buf()
	local current_line = vim.api.nvim_get_current_line()
	local line_num = vim.api.nvim_win_get_cursor(0)[1]
	while not current_line:match("^%s*$") do
		vim.api.nvim_command("normal! j")
		line_num = vim.api.nvim_win_get_cursor(0)[1]
		current_line = vim.api.nvim_get_current_line()
	end
	vim.api.nvim_buf_set_lines(buf, line_num - 1, line_num - 1, false, vim.split(new_block_template, "\n"))
end

vim.keymap.set("n", "<leader>cb", insert_new_block, { desc = "Create New Cell" })
