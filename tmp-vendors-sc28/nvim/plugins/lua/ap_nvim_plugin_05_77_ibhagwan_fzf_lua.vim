nnoremap <unique> <c-P> 
	\ <cmd>lua require('fzf-lua').setup({winopts = { preview = { wrap = 'wrap' } }})<CR>
	\ <cmd>lua require('fzf-lua').files({ cwd = '~/pnphuong29' })<CR>
