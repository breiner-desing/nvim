local terminal = {}

function terminal.mapterminales()
	vim.keymap.set('n', '<leader>tJ', ':split | wincmd J | execute "terminal"<CR>', { noremap = true })
	vim.keymap.set('n', '<leader>tL', ':split | wincmd L | execute "terminal"<CR>', { noremap = true })
	vim.keymap.set('n', '<leader>ft', function() open_terminal() end, { noremap = true })
	vim.keymap.set('n', '<leader>rr', function() find_file_window("terminal.lua") end)
end

function find_file_window(file_name)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if vim.fn.fnamemodify(buf_name, ":t") == file_name then
		print(win)
		vim.api.nvim_set_current_win(win)
		-- return win
    end
  end
  return nil
end

function prueba()
	print("prueba")
	return "prueba"
end

function open_terminal()
	
	-- Crea un nuevo buffer sin nombre para la terminal
	local buf = vim.api.nvim_create_buf(false, true)
	-- Especifica el tamaño de buffer creado para la terminal
	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'hide')
	-- Crea una ventana flotante y establece su tamaño y posición
	
	local win = vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
		row = math.floor((vim.o.lines - (vim.o.lines * 0.8)) / 2),
		col = math.floor((vim.o.columns - (vim.o.columns * 0.8)) / 2),
		style = 'minimal',
		border = "rounded"
	})
	-- Establece el terminal en la ventana flotante
	vim.api.nvim_buf_call(buf, function() vim.cmd('terminal') end)

end

return terminal
