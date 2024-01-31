--[[
-mode=async: Runs the command asynchronously.
-quiet: Suppresses echoing the command line.
-raw: Disables message filtering.
-i=NONE: Ignores changes in the buffer during command execution.
-c open: Opens the quickfix window automatically if there are messages to display.
-pos=bottom: Places the quickfix window at the bottom.
-lines=10: Sets the height of the quickfix window to 10 lines.
]]
--#endregion

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		local opts = { noremap = true, silent = true, desc = 'Compiles and executes C++' }
		vim.keymap.set('n', '<F5>',
			':AsyncRun -mode=async -quiet -raw -i=NONE -c open -pos=bottom -lines=10 g++ % -o %< && ./%< <CR>',
			opts)
	end
})
